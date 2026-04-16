import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/models/station.dart';

class StationRepositoryMock implements StationRepository {
  final MockData mockData;
  StationRepositoryMock({required this.mockData});
  @override
  Future<List<Station>> getAllStation() async {
    return mockData.stations;
  }

  @override
  Future<Station?> getStation(String id) async {
    try {
      return mockData.stations.firstWhere((station) => station.id == id);
    } catch (e) {
      throw Exception("Failed to get station $e");
    }
  }

  @override
  Future<Station?> getStationBySlotId(String slotId) async {
    try {
      return mockData.stations.firstWhere(
        (station) => station.slots.any((slot) => slot.id == slotId),
      );
    } catch (e) {
      throw Exception("Failed to get station by slot id $e");
    }
  }
}
