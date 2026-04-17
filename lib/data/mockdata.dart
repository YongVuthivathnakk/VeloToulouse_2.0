// import 'package:latlong2/latlong.dart';
// import 'package:velotoulouse/models/bike.dart';
// import 'package:velotoulouse/models/booking.dart';
// import 'package:velotoulouse/models/location.dart';
// import 'package:velotoulouse/models/slot.dart';
// import 'package:velotoulouse/models/station.dart';
// import 'package:velotoulouse/models/user.dart';
// import 'package:velotoulouse/models/user_subscription.dart';

// class MockData {
//   List<Bike> bikes = [
//     Bike(id: 'bike_01', isAvailable: true),
//     Bike(id: 'bike_02', isAvailable: true),
//     Bike(id: 'bike_03', isAvailable: true),
//     Bike(id: 'bike_04', isAvailable: true),
//     Bike(id: 'bike_05', isAvailable: true),
//     Bike(id: 'bike_06', isAvailable: true),
//     Bike(id: 'bike_07', isAvailable: true),
//   ];

//   List<Station> stations = [
//     Station(
//       id: 'station_01',
//       name: 'Wat Phnom',
//       location: Location(
//         id: 'loc_01',
//         name: 'Wat Phnom Hill',
//         street: 'Vithei Preah Ang Yukanthor',
//         coords: LatLng(11.5765, 104.9214),
//       ),
//       slots: [
//         Slot(id: 'slot_01', slotNumber: 1, bikeId: 'bike_01'),
//         Slot(id: 'slot_02', slotNumber: 2, bikeId: 'bike_02'),
//         Slot(id: 'slot_03', slotNumber: 3),
//         Slot(id: 'slot_04', slotNumber: 4),
//         Slot(id: 'slot_05', slotNumber: 5),
//       ],
//     ),
//     Station(
//       id: 'station_02',
//       name: 'Royal Palace',
//       location: Location(
//         id: 'loc_02',
//         name: 'Royal Palace Gate',
//         street: 'Samdach Sothearos Blvd',
//         coords: LatLng(11.5645, 104.9301),
//       ),
//       slots: [
//         Slot(id: 'slot_06', slotNumber: 1, bikeId: 'bike_03'),
//         Slot(id: 'slot_07', slotNumber: 2),
//         Slot(id: 'slot_08', slotNumber: 3),
//         Slot(id: 'slot_09', slotNumber: 4, bikeId: 'bike_04'),
//         Slot(id: 'slot_10', slotNumber: 5),
//       ],
//     ),
//     Station(
//       id: 'station_03',
//       name: 'Central Market',
//       location: Location(
//         id: 'loc_03',
//         name: 'Phsar Thmei',
//         street: 'Kampuchea Krom Blvd',
//         coords: LatLng(11.5694, 104.9174),
//       ),
//       slots: [
//         Slot(id: 'slot_11', slotNumber: 1),
//         Slot(id: 'slot_12', slotNumber: 2, bikeId: 'bike_05'),
//         Slot(id: 'slot_13', slotNumber: 3),
//         Slot(id: 'slot_14', slotNumber: 4),
//         Slot(id: 'slot_15', slotNumber: 5),
//       ],
//     ),
//     Station(
//       id: 'station_04',
//       name: 'Riverside',
//       location: Location(
//         id: 'loc_04',
//         name: 'Sisowath Quay',
//         street: 'Quai Sisowath',
//         coords: LatLng(11.5668, 104.9310),
//       ),
//       slots: [
//         Slot(id: 'slot_16', slotNumber: 1, bikeId: 'bike_06'),
//         Slot(id: 'slot_17', slotNumber: 2),
//         Slot(id: 'slot_18', slotNumber: 3, bikeId: 'bike_07'),
//         Slot(id: 'slot_19', slotNumber: 4),
//         Slot(id: 'slot_20', slotNumber: 5),
//       ],
//     ),
//     Station(
//       id: 'station_05',
//       name: 'Independence Monument',
//       location: Location(
//         id: 'loc_05',
//         name: 'Vimean Ekareach',
//         street: 'Norodom Blvd',
//         coords: LatLng(11.5570, 104.9310),
//       ),
//       slots: [
//         Slot(id: 'slot_21', slotNumber: 1),
//         Slot(id: 'slot_22', slotNumber: 2),
//         Slot(id: 'slot_23', slotNumber: 3),
//         Slot(id: 'slot_24', slotNumber: 4),
//         Slot(id: 'slot_25', slotNumber: 5),
//       ],
//     ),
//   ];

//   List<Booking> bookings = [];

//   User user = User(
//     id: 'user_01',
//     name: 'Dara Chan',
//     userSubscription: UserSubscription(
//       id: 'sub_01',
//       expirationDate: DateTime.now().add(const Duration(days: 18)),
//       passType: PassType.monthly,
//     ),
//   );

//   // No subscription — tests blocked booking path
//   User userNoSubscription = User(id: 'user_02', name: 'Sophea Kem');
// }
