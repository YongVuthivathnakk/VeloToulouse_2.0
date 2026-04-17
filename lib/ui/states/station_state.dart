// import 'package:flutter/material.dart';
// import 'package:velotoulouse/data/repository/station_repository.dart';
// import 'package:velotoulouse/models/station.dart';

// class StationState extends ChangeNotifier {
//   final StationRepository stationRepository;
//   List<Station> _stations = [];
//   Station? _selectedStation;

//   StationState({required this.stationRepository}) {
//     _init();
//   }

//   List<Station> get stations => _stations;
//   Station? get selectedStation => _selectedStation;

//   // Future<void> _init() async {
//   //   _stations = await stationRepository.getAllStation();
//   //   _selectedStation = _stations.isNotEmpty ? _stations.first : null; 
//   //   notifyListeners();
//   // }
//   Future<void> _init() async {
//     print("Fetching stations...");
//     try {
//       _stations = await stationRepository.getAllStation();
//       print("Stations loaded: ${_stations.length}");
//       _selectedStation = _stations.isNotEmpty ? _stations.first : null;
//       print("Selected station: ${_selectedStation?.name}");
//     } catch (e) {
//       print("Error: $e");
//     }
//     notifyListeners();
//   }

//   Future<void> selectStation(String stationId) async {
//     _selectedStation = await stationRepository.getStation(stationId);
//     notifyListeners();
//   }
// }
