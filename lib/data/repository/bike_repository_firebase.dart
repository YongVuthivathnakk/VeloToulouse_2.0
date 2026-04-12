import 'dart:convert';

import 'package:velotoulouse/data/dtos/bike_dto.dart';
import 'package:velotoulouse/data/repository/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:http/http.dart' as http;

class BikeRepositoryFirebase implements BikeRepository {
  static const _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';

  @override
  Future<Bike?> getBike(String id) async {
    final uri = Uri.https(_baseUrl, 'bikes/$id.json');
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        if (response.body == 'null') return null;
        Map<String, dynamic> bikeJson = jsonDecode(response.body);
        return BikeDto.fromJson(id, bikeJson);
      }
      throw Exception("Failed to load bike: ${response.statusCode}");
    } catch (e) {
      throw Exception("Error fetching bike: $e");
    }
  }
}
