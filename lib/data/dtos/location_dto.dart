import 'package:latlong2/latlong.dart';
import 'package:velotoulouse/models/location.dart';

class LocationDto {
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String streetKey = 'street';
  static const String latKey = 'lat';
  static const String lngKey = 'lng';

  static Location fromJson(Map<dynamic, dynamic> json) {
    assert(json[idKey] is String);
    assert(json[nameKey] is String);
    assert(json[streetKey] is String);
    assert(json[latKey] is double);
    assert(json[lngKey] is double);
    return Location(
      id: json[idKey],
      name: json[nameKey],
      street: json[streetKey],
      coords: LatLng(json[latKey], json[lngKey]),
    );
  }

  static Map<String, dynamic> toJson(Location location) {
    return {
      idKey: location.id,
      nameKey: location.name,
      streetKey: location.street,
      latKey: location.coords.latitude,
      lngKey: location.coords.longitude,
    };
  }
}
