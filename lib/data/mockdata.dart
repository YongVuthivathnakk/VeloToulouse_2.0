import 'package:latlong2/latlong.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/location.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/user.dart';

class MockData {
  static List<Bike> bikes = [
    Bike(id: "bike_01", isAvailable: true),
    Bike(id: "bike_02", isAvailable: true),
    Bike(id: "bike_03", isAvailable: true),
    Bike(id: "bike_04", isAvailable: true),
    Bike(id: "bike_05", isAvailable: true),
  ];

  static List<Station> stations = [
    Station(
      id: "station_01",
      name: "Wat Phnom",
      location: Location(
        id: "loc_01",
        name: "Wat Phnom Hill",
        street: "Vithei Preah Ang Yukanthor",
        coords: LatLng(11.5765, 104.9214),
      ),
      slots: [
        Slot(id: "slot_01", slotNumber: 1, bikeId: "bike_01"),
        Slot(id: "slot_02", slotNumber: 2, bikeId: "bike_02"),
        Slot(id: "slot_03", slotNumber: 3, bikeId: null),
        Slot(id: "slot_04", slotNumber: 4, bikeId: null),
        Slot(id: "slot_05", slotNumber: 5, bikeId: null),
      ],
    ),
    Station(
      id: "station_02",
      name: "Royal Palace",
      location: Location(
        id: "loc_02",
        name: "Royal Palace Gate",
        street: "Samdach Sothearos Blvd",
        coords: LatLng(11.5645, 104.9301),
      ),
      slots: [
        Slot(id: "slot_06", slotNumber: 1, bikeId: "bike_03"),
        Slot(id: "slot_07", slotNumber: 2, bikeId: null),
        Slot(id: "slot_08", slotNumber: 3, bikeId: null),
        Slot(id: "slot_09", slotNumber: 4, bikeId: "bike_04"),
        Slot(id: "slot_10", slotNumber: 5, bikeId: null),
      ],
    ),
    Station(
      id: "station_03",
      name: "Central Market",
      location: Location(
        id: "loc_03",
        name: "Phsar Thmei",
        street: "Kampuchea Krom Blvd",
        coords: LatLng(11.5694, 104.9174),
      ),
      slots: [
        Slot(id: "slot_11", slotNumber: 1, bikeId: null),
        Slot(id: "slot_12", slotNumber: 2, bikeId: "bike_05"),
        Slot(id: "slot_13", slotNumber: 3, bikeId: null),
        Slot(id: "slot_14", slotNumber: 4, bikeId: null),
        Slot(id: "slot_15", slotNumber: 5, bikeId: null),
      ],
    ),
  ];

  static List<Booking> bookings = [
    Booking(
      id: "booking_01",
      bookingTime: DateTime.now(),
      bookingStatus: BookingStatus.active,
      bookingType: BookingType.ticket,
      slotId: "slot_01",
    ),
    Booking(
      id: "booking_02",
      bookingTime: DateTime.now().subtract(Duration(minutes: 30)),
      bookingStatus: BookingStatus.completed,
      bookingType: BookingType.ticket,
      slotId: "slot_09",
    ),
  ];

  static List<User> users = [
    User(
      id: "user_01",
      name: "Monica",
      userSubscription: null, 
      bookedBike: bookings[0], 
    ),
    User(
      id: "user_02",
      name: "Dara",
      userSubscription: null,
      bookedBike: null,
    ),
  ];
}
