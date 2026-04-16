import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository_firebase.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository_mock.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository_firebase.dart';
import 'package:velotoulouse/data/repository/slot_repository/slot_repository.dart';
import 'package:velotoulouse/data/repository/slot_repository/slot_repository_firebase.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository_firebase.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository_mock.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository_firebase.dart';
import 'package:velotoulouse/main_common.dart';
import 'package:velotoulouse/service/booking_service.dart';
import 'package:velotoulouse/service/subscription_service.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

List<InheritedProvider> get prodProviders {
  return [
    Provider<BikeRepository>(create: (_) => BikeRepositoryFirebase()),
    Provider<StationRepository>(create: (_) => StationRepositoryFirebase()),
    Provider<UserRepository>(create: (_) => UserRepositoryFirebase()),
    Provider<BookingRepository>(create: (_) => BookingRepositoryFirebase()),
    Provider<SlotRepository>(create: (_) => SlotRepositoryFirebase()),
    Provider<BookingService>(
      create: (context) => BookingService(
        bookingRepository: context.read<BookingRepository>(),
        bikeRepository: context.read<BikeRepository>(),
        userRepository: context.read<UserRepository>(),
        slotRepository: context.read<SlotRepository>(),
      ),
    ),
    Provider<SubscriptionService>(create: (context) => SubscriptionService(userRepository: context.read<UserRepository>())),
    ChangeNotifierProvider<UserState>(
      create: (context) =>
          UserState(userRepository: context.read<UserRepository>()),
    ),
    ChangeNotifierProvider<StationState>(
      create: (context) =>
          StationState(stationRepository: context.read<StationRepository>()),
    ),
  ];
}

void main() {
  mainCommon(prodProviders);
}
