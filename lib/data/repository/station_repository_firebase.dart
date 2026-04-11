import 'dart:convert';

import 'package:velotoulouse/data/dtos/station_dto.dart';
import 'package:velotoulouse/data/repository/station_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:http/http.dart' as http;

class StationRepositoryFirebase extends StationRepository {
  static const String _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';
  @override
  Future<List<Station>> getAllStation() async {
    final uri = Uri.https(_baseUrl, 'stations.json');
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        if (response.body == 'null') return [];
        Map<String, dynamic> stationsJson = jsonDecode(response.body);
        return stationsJson.entries
            .map((station) => StationDto.fromJson(station.key, station.value))
            .toList();
      }
      throw Exception("Failed to load stations: ${response.statusCode}");
    } catch (e) {
      throw Exception("Error fetching station $e");
    }
  }

  @override
  Future<Station?> getStation(String id) async {
    final uri = Uri.https(_baseUrl, 'stations/$id.json');
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        if (response.body == 'null') return null;
        Map<String, dynamic> stationJson = jsonDecode(response.body);
        return StationDto.fromJson(id, stationJson);
      }
      throw Exception("Failed to load station: ${response.statusCode}");
    } catch (e) {
      throw Exception("Error fetching station: $e");
    }
  }
}
