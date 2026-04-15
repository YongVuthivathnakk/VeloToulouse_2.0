import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
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

  Station? get selectedStation => stationState.selectedStation;

  List<Slot> get allSlots => selectedStation?.slots ?? [];
  List<Slot> get occupiedSlots => selectedStation?.occupiedSlots ?? [];
  List<Bike> _bikes = [];
  Future<void> _init() async {
    _bikes = await bikeRepository.getAllBike();
    notifyListeners();
  }

  bool shouldDisplaySlot(Slot slot) {
    if (slot.bikeId == null) return true;

    final bike = _bikes.firstWhere((bike) => bike.id == slot.bikeId);

    return bike.isAvailable;
  }

  int get totalAvailableBikeSlots {
    return allSlots.where((slot) {
      if (slot.bikeId == null) return false;

      final bike = _bikes.firstWhere(
        (bike) => bike.id == slot.bikeId,
        orElse: () => Bike(id: '', isAvailable: false),
      );

      return bike.isAvailable;
    }).length;
  }
}
