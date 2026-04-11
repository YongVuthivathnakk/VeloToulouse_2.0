import 'package:flutter/material.dart';
import 'package:velotoulouse/data/repository/station_repository.dart';
import 'package:velotoulouse/models/station.dart';

class StationState extends ChangeNotifier {
  final StationRepository stationRepository;
  List<Station> _stations = [];
  Station? _selectedStation;

  StationState({required this.stationRepository}) {
    _init();
  }

  List<Station> get stations => _stations;
  Station? get selectedStation => _selectedStation;

  Future<void> _init() async {
    _stations = await stationRepository.getAllStation();
    notifyListeners();
  }

  Future<void> selectStation(String stationId) async {
    _selectedStation = await stationRepository.getStation(stationId);
    notifyListeners();
  }
}
