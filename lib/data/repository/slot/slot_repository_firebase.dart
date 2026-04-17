import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velotoulouse/data/dtos/slot_dto.dart';
import 'package:velotoulouse/data/repository/slot/slot_repository.dart';
import 'package:velotoulouse/models/slot.dart';

class SlotRepositoryFirebase implements SlotRepository{
  static const _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';
  @override
  Future<Slot?> getSlotById(String slotId) async {
    final uri = Uri.https(_baseUrl, 'stations.json');

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception("Failed to load stations");
      }

      final data = jsonDecode(response.body);

      if (data == null) return null;

      final Map<String, dynamic> stations = data;

      for (final stationEntry in stations.entries) {
        final station = stationEntry.value;

        if (station['slots'] == null) continue;

        final slots = station['slots'] as Map<String, dynamic>;

        if (slots.containsKey(slotId)) {
          final slotJson = slots[slotId];
          return SlotDto.fromJson(slotId, slotJson);
        }
      }
      return null;
    } catch (e) {
      throw Exception("Error fetching slot: $e");
    }
  }
}