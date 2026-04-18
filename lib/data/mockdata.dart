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
//         Slot(id: 'slot_01', slotNumber: 1, bikeId: 'bike_01', stationId: 'station_01'),
//         Slot(id: 'slot_02', slotNumber: 2, bikeId: 'bike_02', stationId: 'station_01'),
//         Slot(id: 'slot_03', slotNumber: 3, stationId: 'station_01'),
//         Slot(id: 'slot_04', slotNumber: 4, stationId: 'station_01'),
//         Slot(id: 'slot_05', slotNumber: 5, stationId: 'station_01'),
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
//         Slot(id: 'slot_06', slotNumber: 1, bikeId: 'bike_03', stationId: 'station_02'),
//         Slot(id: 'slot_07', slotNumber: 2, stationId: 'station_02'),
//         Slot(id: 'slot_08', slotNumber: 3, stationId: 'station_02'),
//         Slot(id: 'slot_09', slotNumber: 4, bikeId: 'bike_04', stationId: 'station_02'),
//         Slot(id: 'slot_10', slotNumber: 5, stationId: 'station_02'),
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
//         Slot(id: 'slot_11', slotNumber: 1, stationId: 'station_03'),
//         Slot(id: 'slot_12', slotNumber: 2, bikeId: 'bike_05', stationId: 'station_03'),
//         Slot(id: 'slot_13', slotNumber: 3, stationId: 'station_03'),
//         Slot(id: 'slot_14', slotNumber: 4, stationId: 'station_03'),
//         Slot(id: 'slot_15', slotNumber: 5, stationId: 'station_03'),
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
//         Slot(id: 'slot_16', slotNumber: 1, bikeId: 'bike_06', stationId: 'station_04'),
//         Slot(id: 'slot_17', slotNumber: 2, stationId: 'station_04'),
//         Slot(id: 'slot_18', slotNumber: 3, bikeId: 'bike_07', stationId: 'station_04'),
//         Slot(id: 'slot_19', slotNumber: 4, stationId: 'station_04'),
//         Slot(id: 'slot_20', slotNumber: 5, stationId: 'station_04'),
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
//         Slot(id: 'slot_21', slotNumber: 1, stationId: 'station_05'),
//         Slot(id: 'slot_22', slotNumber: 2, stationId: 'station_05'),
//         Slot(id: 'slot_23', slotNumber: 3, stationId: 'station_05'),
//         Slot(id: 'slot_24', slotNumber: 4, stationId: 'station_05'),
//         Slot(id: 'slot_25', slotNumber: 5, stationId: 'station_05'),
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


import 'package:latlong2/latlong.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/location.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:velotoulouse/models/user_subscription.dart';

class MockData {
  List<Bike> bikes = [
    Bike(id: 'bike_01', isAvailable: true),
    Bike(id: 'bike_02', isAvailable: true),
    Bike(id: 'bike_03', isAvailable: true),
    Bike(id: 'bike_04', isAvailable: true),
    Bike(id: 'bike_05', isAvailable: true),
    Bike(id: 'bike_06', isAvailable: true),
    Bike(id: 'bike_07', isAvailable: true),
    Bike(id: 'bike_08', isAvailable: true),
    Bike(id: 'bike_09', isAvailable: true),
    Bike(id: 'bike_10', isAvailable: true),
    Bike(id: 'bike_11', isAvailable: true),
    Bike(id: 'bike_12', isAvailable: true),
    Bike(id: 'bike_13', isAvailable: true),
    Bike(id: 'bike_14', isAvailable: true),
    Bike(id: 'bike_15', isAvailable: true),
    Bike(id: 'bike_16', isAvailable: true),
    Bike(id: 'bike_17', isAvailable: true),
    Bike(id: 'bike_18', isAvailable: true),
    Bike(id: 'bike_19', isAvailable: true),
  ];

  List<Station> stations = [
    Station(
      id: 'station_01',
      name: 'Wat Phnom',
      location: Location(
        id: 'loc_01',
        name: 'Wat Phnom Hill',
        street: 'Vithei Preah Ang Yukanthor',
        coords: LatLng(11.5765, 104.9214),
      ),
      slots: [
        Slot(
          id: 'slot_01',
          slotNumber: 1,
          bikeId: 'bike_01',
          stationId: 'station_01',
        ),
        Slot(
          id: 'slot_02',
          slotNumber: 2,
          bikeId: 'bike_02',
          stationId: 'station_01',
        ),
        Slot(id: 'slot_03', slotNumber: 3, stationId: 'station_01'),
        Slot(id: 'slot_04', slotNumber: 4, stationId: 'station_01'),
        Slot(id: 'slot_05', slotNumber: 5, stationId: 'station_01'),
      ],
    ),
    Station(
      id: 'station_02',
      name: 'Royal Palace',
      location: Location(
        id: 'loc_02',
        name: 'Royal Palace Gate',
        street: 'Samdach Sothearos Blvd',
        coords: LatLng(11.5645, 104.9301),
      ),
      slots: [
        Slot(
          id: 'slot_06',
          slotNumber: 1,
          bikeId: 'bike_03',
          stationId: 'station_02',
        ),
        Slot(id: 'slot_07', slotNumber: 2, stationId: 'station_02'),
        Slot(id: 'slot_08', slotNumber: 3, stationId: 'station_02'),
        Slot(
          id: 'slot_09',
          slotNumber: 4,
          bikeId: 'bike_04',
          stationId: 'station_02',
        ),
        Slot(id: 'slot_10', slotNumber: 5, stationId: 'station_02'),
      ],
    ),
    Station(
      id: 'station_03',
      name: 'Phsar Thmei',
      location: Location(
        id: 'loc_03',
        name: 'Central Market',
        street: 'Kampuchea Krom Blvd',
        coords: LatLng(11.5694, 104.9174),
      ),
      slots: [
        Slot(id: 'slot_11', slotNumber: 1, stationId: 'station_03'),
        Slot(
          id: 'slot_12',
          slotNumber: 2,
          bikeId: 'bike_05',
          stationId: 'station_03',
        ),
        Slot(id: 'slot_13', slotNumber: 3, stationId: 'station_03'),
        Slot(id: 'slot_14', slotNumber: 4, stationId: 'station_03'),
        Slot(id: 'slot_15', slotNumber: 5, stationId: 'station_03'),
      ],
    ),
    Station(
      id: 'station_04',
      name: 'Vimean Ekareach',
      location: Location(
        id: 'loc_04',
        name: 'Independence Monument',
        street: 'Norodom Blvd',
        coords: LatLng(11.5572, 104.9233),
      ),
      slots: [
        Slot(
          id: 'slot_16',
          slotNumber: 1,
          bikeId: 'bike_06',
          stationId: 'station_04',
        ),
        Slot(id: 'slot_17', slotNumber: 2, stationId: 'station_04'),
        Slot(
          id: 'slot_18',
          slotNumber: 3,
          bikeId: 'bike_07',
          stationId: 'station_04',
        ),
        Slot(id: 'slot_19', slotNumber: 4, stationId: 'station_04'),
        Slot(id: 'slot_20', slotNumber: 5, stationId: 'station_04'),
      ],
    ),
    Station(
      id: 'station_05',
      name: 'Phsar Tuol Tom Poung',
      location: Location(
        id: 'loc_05',
        name: 'Russian Market',
        street: 'Street 155',
        coords: LatLng(11.5447, 104.9178),
      ),
      slots: [
        Slot(
          id: 'slot_21',
          slotNumber: 1,
          bikeId: 'bike_08',
          stationId: 'station_05',
        ),
        Slot(
          id: 'slot_22',
          slotNumber: 2,
          bikeId: 'bike_09',
          stationId: 'station_05',
        ),
        Slot(id: 'slot_23', slotNumber: 3, stationId: 'station_05'),
        Slot(id: 'slot_24', slotNumber: 4, stationId: 'station_05'),
        Slot(id: 'slot_25', slotNumber: 5, stationId: 'station_05'),
      ],
    ),
    Station(
      id: 'station_06',
      name: 'Boeung Keng Kang',
      location: Location(
        id: 'loc_06',
        name: 'BKK1',
        street: 'Street 278',
        coords: LatLng(11.5538, 104.9247),
      ),
      slots: [
        Slot(id: 'slot_26', slotNumber: 1, stationId: 'station_06'),
        Slot(
          id: 'slot_27',
          slotNumber: 2,
          bikeId: 'bike_10',
          stationId: 'station_06',
        ),
        Slot(id: 'slot_28', slotNumber: 3, stationId: 'station_06'),
        Slot(
          id: 'slot_29',
          slotNumber: 4,
          bikeId: 'bike_11',
          stationId: 'station_06',
        ),
        Slot(id: 'slot_30', slotNumber: 5, stationId: 'station_06'),
      ],
    ),
    Station(
      id: 'station_07',
      name: 'Sisowath Quay',
      location: Location(
        id: 'loc_07',
        name: 'Riverside',
        street: 'Sisowath Quay',
        coords: LatLng(11.5676, 104.9311),
      ),
      slots: [
        Slot(
          id: 'slot_31',
          slotNumber: 1,
          bikeId: 'bike_12',
          stationId: 'station_07',
        ),
        Slot(id: 'slot_32', slotNumber: 2, stationId: 'station_07'),
        Slot(id: 'slot_33', slotNumber: 3, stationId: 'station_07'),
        Slot(id: 'slot_34', slotNumber: 4, stationId: 'station_07'),
        Slot(
          id: 'slot_35',
          slotNumber: 5,
          bikeId: 'bike_13',
          stationId: 'station_07',
        ),
      ],
    ),
    Station(
      id: 'station_08',
      name: 'Olympic Stadium',
      location: Location(
        id: 'loc_08',
        name: 'National Olympic Stadium',
        street: 'Sihanouk Blvd',
        coords: LatLng(11.5596, 104.9121),
      ),
      slots: [
        Slot(id: 'slot_36', slotNumber: 1, stationId: 'station_08'),
        Slot(
          id: 'slot_37',
          slotNumber: 2,
          bikeId: 'bike_14',
          stationId: 'station_08',
        ),
        Slot(id: 'slot_38', slotNumber: 3, stationId: 'station_08'),
        Slot(id: 'slot_39', slotNumber: 4, stationId: 'station_08'),
        Slot(
          id: 'slot_40',
          slotNumber: 5,
          bikeId: 'bike_15',
          stationId: 'station_08',
        ),
      ],
    ),
    Station(
      id: 'station_09',
      name: 'Tuol Sleng',
      location: Location(
        id: 'loc_09',
        name: 'Tuol Sleng Museum',
        street: 'Street 113',
        coords: LatLng(11.5493, 104.9171),
      ),
      slots: [
        Slot(
          id: 'slot_41',
          slotNumber: 1,
          bikeId: 'bike_16',
          stationId: 'station_09',
        ),
        Slot(id: 'slot_42', slotNumber: 2, stationId: 'station_09'),
        Slot(id: 'slot_43', slotNumber: 3, stationId: 'station_09'),
        Slot(
          id: 'slot_44',
          slotNumber: 4,
          bikeId: 'bike_17',
          stationId: 'station_09',
        ),
        Slot(id: 'slot_45', slotNumber: 5, stationId: 'station_09'),
      ],
    ),
    Station(
      id: 'station_10',
      name: 'Phnom Penh Night Market',
      location: Location(
        id: 'loc_10',
        name: 'Night Market',
        street: 'Sisowath Quay Street 108',
        coords: LatLng(11.5712, 104.9298),
      ),
      slots: [
        Slot(id: 'slot_46', slotNumber: 1, stationId: 'station_10'),
        Slot(
          id: 'slot_47',
          slotNumber: 2,
          bikeId: 'bike_18',
          stationId: 'station_10',
        ),
        Slot(id: 'slot_48', slotNumber: 3, stationId: 'station_10'),
        Slot(id: 'slot_49', slotNumber: 4, stationId: 'station_10'),
        Slot(
          id: 'slot_50',
          slotNumber: 5,
          bikeId: 'bike_19',
          stationId: 'station_10',
        ),
      ],
    ),
  ];

  List<Booking> bookings = [
   
  ];

  User user = User(
    id: 'user_01',
    name: 'Dara Chan',
    userSubscription: UserSubscription(
      id: 'sub_01',
      expirationDate: DateTime.now().add(const Duration(days: 18)),
      passType: PassType.monthly,
    ),
  );

  User userNoSubscription = User(id: 'user_02', name: 'Sophea Kem');
}
