import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/slot.dart';

class StationDetailsViewModel extends ChangeNotifier {
  final BikeRepository bikeRepository;

  StationDetailsViewModel({required this.bikeRepository}) {
    _init();
  }

  List<Bike> _bikes = [];

  Future<void> _init() async {
    _bikes = await bikeRepository.getAllBike();
    notifyListeners();
  }

  bool shouldDisplaySlot(Slot slot) {
    if (slot.bikeId == null) return true;

    final bike = _bikes.firstWhere(
      (bike) => bike.id == slot.bikeId,
      orElse: () => Bike(id: '', isAvailable: false),
    );

    return bike.isAvailable;
  }

  int totalAvailableBikeSlots(List<Slot> slots) {
    return slots.where((slot) {
      if (slot.bikeId == null) return false;

      final bike = _bikes.firstWhere(
        (bike) => bike.id == slot.bikeId,
        orElse: () => Bike(id: '', isAvailable: false),
      );

      return bike.isAvailable;
    }).length;
  }
}
