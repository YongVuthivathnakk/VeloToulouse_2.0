import 'package:latlng/latlng.dart';

class Location {
  final String id;
  String name;
  String street;
  LatLng coords;

  Location({
    required this.id,
    required this.name,
    required this.street,
    required this.coords,
  });

  Location copyWith({
    String? name, 
    String? street, 
    LatLng? coords,
  }){
    return Location(
      id: id,
      name: name ?? this.name, 
      street: street ?? this.street, 
      coords: coords ?? this.coords,
    );
  }
}
