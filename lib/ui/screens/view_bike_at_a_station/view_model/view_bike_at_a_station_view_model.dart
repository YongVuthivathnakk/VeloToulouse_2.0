import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/bike_repository.dart';
import 'package:velotoulouse/data/repository/station_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class ViewBikeAtAStationViewModel extends ChangeNotifier {
  final BikeRepository bikeRepository;
  final StationState stationState;

  ViewBikeAtAStationViewModel({
    required this.bikeRepository,
    required this.stationState,
  }) {
    stationState.addListener(notifyListeners);
    _init();
  }

  AsyncValue<List<Bike>> bikeValue = AsyncValue.loading();

  void _init() async{
    loadBike();
  }

  void loadBike() async {
    final station = stationState.selectedStation;
    if (station == null) return;
    bikeValue = AsyncValue.loading();
    notifyListeners();
    try {
      final bikesData = await bikeRepository.getAllBikeFromAStation(station.id);
      bikeValue = AsyncValue.success(bikesData);
    } catch (e) {
      bikeValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  List<int> get availableSlots {
    final station = stationState.selectedStation;
    if (station == null) return [];
    return station.getAvailableSlot();
  }
}
