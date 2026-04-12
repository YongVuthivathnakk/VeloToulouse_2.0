import 'package:velotoulouse/data/dtos/location_dto.dart';
import 'package:velotoulouse/data/dtos/slot_dto.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';

class StationDto {
  static const String nameKey = 'name';
  static const String locationKey = 'location';
  static const String slotsKey = 'slots';

  static Station fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[nameKey] is String);

    final slotsRaw = json[slotsKey];
    final List<Slot> slots = slotsRaw != null
        ? (slotsRaw as Map<dynamic, dynamic>).entries
              .map((e) => SlotDto.fromJson(e.key, e.value))
              .toList()
        : [];

    return Station(
      id: id,
      name: json[nameKey],
      location: LocationDto.fromJson(json[locationKey]),
      slots: slots,
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      nameKey: station.name,
      locationKey: LocationDto.toJson(station.location),
      slotsKey: {for (var slot in station.slots) slot.id: SlotDto.toJson(slot)},
    };
  }
}
