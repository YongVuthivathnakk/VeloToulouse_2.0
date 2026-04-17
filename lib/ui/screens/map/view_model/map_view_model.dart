import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class MapViewModel extends ChangeNotifier {
  final StationRepository stationRepo;
  final BikeRepository bikeRepo;

  MapViewModel({required this.stationRepo, required this.bikeRepo});

  AsyncValue<List<Station>> stationsState = AsyncValue.loading();
  AsyncValue<Map<String, int>> bikeCountsState = AsyncValue.loading();

  StreamSubscription? _sub;

  void startListening() {
    stationsState = AsyncValue.loading();
    bikeCountsState = AsyncValue.loading();
    notifyListeners();

    _sub?.cancel();

    _sub =
        Rx.combineLatest2(stationRepo.watchStations(), bikeRepo.watchBikes(), (
          List<Station> stations,
          List<Bike> bikes,
        ) {
          final bikeMap = {for (var b in bikes) b.id: b};

          final counts = <String, int>{};

          for (var station in stations) {
            int count = 0;

            for (var slot in station.slots) {
              final bike = bikeMap[slot.bikeId];
              if (bike != null && bike.isAvailable) {
                count++;
              }
            }

            counts[station.id] = count;
          }

          return (stations, counts);
        }).listen(
          (data) {
            final stations = data.$1;
            final counts = data.$2;

            stationsState = AsyncValue.success(stations);
            bikeCountsState = AsyncValue.success(counts);

            notifyListeners();
          },
          onError: (error) {
            stationsState = AsyncValue.error(error);
            bikeCountsState = AsyncValue.error(error);
            notifyListeners();
          },
        );
  }

  int getBikeCount(String stationId) {
    return bikeCountsState.data?[stationId] ?? 0;
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
