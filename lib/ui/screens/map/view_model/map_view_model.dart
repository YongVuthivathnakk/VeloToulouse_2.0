import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class MapViewModel extends ChangeNotifier {
  final StationRepository stationRepo;

  MapViewModel({required this.stationRepo});

  AsyncValue<List<Station>> stationsState = AsyncValue.loading();

  StreamSubscription? _stationSub;

  void startListeningStations() {
    stationsState = AsyncValue.loading();
    notifyListeners();

    _stationSub?.cancel();

    _stationSub = stationRepo.watchStations().listen(
      (stations) {
        stationsState = AsyncValue.success(stations);
        notifyListeners();
      },
      onError: (error) {
        stationsState = AsyncValue.error(error);
        notifyListeners();
      },
    );
  }

  int getAvailableBikes(Station station) {
    return station.slots.where((s) => s.bikeId != null).length;
  }
}
