import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class MapViewModel extends ChangeNotifier {
  final StationRepository stationRepo;

  MapViewModel({required this.stationRepo});

  AsyncValue<List<Station>> stationsState = AsyncValue.loading();

  Future<void> loadStations() async {
    stationsState = AsyncValue.loading();
    notifyListeners();

    try {
      final stations = await stationRepo.getAllStation();

      stationsState = AsyncValue.success(stations);
    } catch (e) {
      stationsState = AsyncValue.error(e);
    }

    notifyListeners();
  }

  int getAvailableBikes(Station station) {
    return station.slots.where((s) => s.bikeId != null).length;
  }
}
