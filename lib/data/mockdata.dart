import 'package:latlng/latlng.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/location.dart';
import 'package:velotoulouse/models/pass.dart';
import 'package:velotoulouse/models/station.dart';

class MockData {
  static List<Station> stations = [
    Station(
      id: "station_01",
      name: "Central Park",
      totalSlots: 10,
      locationPosition: Location(
        id: "loc_01",
        name: "West Gate",
        street: "123 Main St",
        locationPosition: LatLng.degree(43.6008, 1.4423),
      ),
      occupiedSlots: {1: "bike_01", 3: "bike_02"},
    ),
    Station(
      id: "station_02",
      name: "City Hall",
      totalSlots: 8,
      locationPosition: Location(
        id: "loc_02",
        name: "City Hall",
        street: "456 Center Ave",
        locationPosition: LatLng.degree(43.6008, 1.4423),
      ),
    ),
  ];

  static List<Bike> bikes = [
    Bike(id: "bike_01", stationId: "station_01"),
    Bike(id: "bike_02", stationId: "station_01"),
    Bike(id: "bike_03", stationId: "station_02"),
  ];

  static List<Pass> passes = [];
}
