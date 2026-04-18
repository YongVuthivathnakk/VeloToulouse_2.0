import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';

class StationDetailsViewModel extends ChangeNotifier {
  final String stationId;
  final BikeRepository bikeRepository;
  final StationRepository stationRepository;

  StationDetailsViewModel({
    required this.stationId,
    required this.bikeRepository,
    required this.stationRepository,
  }){
    _init();
  }

  Stream<List<Bike>> get bikeStream => bikeRepository.watchBikes();

  Stream<Station?> get stationStream => stationRepository.watchStations().map(
    (stations) => stations.where((s) => s.id == stationId).firstOrNull,
  );

  List<Bike> _bikes = [];
  StreamSubscription? _bikeSub;

  void _init() {
    _bikeSub = bikeStream.listen((bikes) {
      _bikes = bikes;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _bikeSub?.cancel();
    super.dispose();
  }

  Bike? getBike(String? bikeId) {
    if (bikeId == null) return null;

    try {
      return _bikes.firstWhere((b) => b.id == bikeId);
    } catch (_) {
      return null;
    }
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
