import 'package:latlng/latlng.dart';

class Location {
  final String id;
  String name;
  String street;
  LatLng locationPosition;

  Location({
    required this.id,
    required this.name,
    required this.street,
    required this.locationPosition,
  });

  Location copyWith({
    String? name, 
    String? street, 
    LatLng? locationPosition,
  }){
    return Location(
      id: id,
      name: name ?? this.name, 
      street: street ?? this.street, 
      locationPosition: locationPosition ?? this.locationPosition);
  }
}
