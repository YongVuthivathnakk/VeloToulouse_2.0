import 'package:latlng/latlng.dart';

class Location {
  String id;
  String name;
  String street;
  LatLng locationPosition;

  Location({
    required this.id,
    required this.name,
    required this.street,
    required this.locationPosition,
  });
}
