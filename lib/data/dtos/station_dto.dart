import 'package:velotoulouse/data/dtos/location_dto.dart';
import 'package:velotoulouse/models/station.dart';

class StationDto {
  static const String nameKey = 'name';
  static const String totalSlotsKey = 'totalSlots';
  static const String occupiedSlotsKey = 'occupiedSlots';
  static const String locationKey = 'location';

  static Station fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[totalSlotsKey] is int);
    return Station(
      id: id,
      name: json[nameKey],
      totalSlots: json[totalSlotsKey],
      occupiedSlots: json[occupiedSlotsKey] != null
          ? (json[occupiedSlotsKey] is Map
                ? Map<String, String>.from(
                    json[occupiedSlotsKey],
                  ).map((key, value) => MapEntry(int.parse(key), value))
                : (json[occupiedSlotsKey] as List)
                      .asMap()
                      .entries
                      .where((e) => e.value != null)
                      .map((e) => MapEntry(e.key, e.value.toString()))
                      .fold<Map<int, String>>(
                        {},
                        (map, e) => map..[e.key] = e.value,
                      ))
          : {},
      locationPosition: LocationDto.fromJson(json[locationKey]),
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      nameKey: station.name,
      totalSlotsKey: station.totalSlots,
      occupiedSlotsKey: station.occupiedSlots.map(
        (key, value) => MapEntry(key.toString(), value),
      ),
      locationKey: LocationDto.toJson(station.locationPosition),
    };
  }
}
