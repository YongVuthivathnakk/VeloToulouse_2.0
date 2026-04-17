import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:velotoulouse/data/dtos/bike_dto.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:http/http.dart' as http;

class BikeRepositoryFirebase implements BikeRepository {
  static const _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';

  final DatabaseReference _db = FirebaseDatabase.instance.ref();

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

  @override
  Future<Bike?> updateBikeAvailability(String bikeId, bool status) async {
    final uri = Uri.https(_baseUrl, 'bikes/$bikeId.json');

    try {
      final response = await http.patch(
        uri,
        body: jsonEncode({'isAvailable': status}),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to update bike: ${response.statusCode}");
      }

      if (response.body == 'null') return null;

      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      return BikeDto.fromJson(bikeId, json);
    } catch (e) {
      throw Exception("Error updating bike availability: $e");
    }
  }

  @override
  Future<List<Bike>> getAllBike() async {
    final uri = Uri.https(_baseUrl, 'bikes.json');

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception("Failed to load bikes: ${response.statusCode}");
      }

      if (response.body == 'null') {
        return [];
      }

      final Map<String, dynamic> bikeJson =
          jsonDecode(response.body) as Map<String, dynamic>;

      final List<Bike> bikes = bikeJson.entries.map((entry) {
        final id = entry.key;
        final data = entry.value as Map<String, dynamic>;
        return BikeDto.fromJson(id, data);
      }).toList();

      return bikes;
    } catch (e) {
      throw Exception("Error fetching bikes: $e");
    }
  }

  @override
  Stream<List<Bike>> watchBikes() {
    final ref = _db.child('bikes');

    return ref.onValue.map((event) {
      final data = event.snapshot.value;

      if (data == null) return [];

      final map = Map<String, dynamic>.from(data as Map);

      return map.entries.map((e) {
        return BikeDto.fromJson(e.key, Map<String, dynamic>.from(e.value));
      }).toList();
    });
  }
}
