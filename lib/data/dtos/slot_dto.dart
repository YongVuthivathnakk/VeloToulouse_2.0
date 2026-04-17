import 'package:velotoulouse/models/slot.dart';

class SlotDto {
  static const String idKey = 'id';
  static const String slotNumberKey = 'slotNumber';
  static const String bikeIdKey = 'bikeId';
  static const String stationIdKey = 'stationId';

  static Slot fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[slotNumberKey] is int);
    return Slot(
      id: id,
      stationId: json[stationIdKey],
      slotNumber: json[slotNumberKey],
      bikeId: json[bikeIdKey],
    );
  }

  static Map<String, dynamic> toJson(Slot slot) {
    return {
      slotNumberKey: slot.slotNumber,
      bikeIdKey: slot.bikeId,
      stationIdKey: slot.stationId,
    };
  }
}