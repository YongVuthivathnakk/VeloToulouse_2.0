import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository_firebase.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository_firebase.dart';
import 'package:velotoulouse/data/repository/slot/slot_repository.dart';
import 'package:velotoulouse/data/repository/slot/slot_repository_firebase.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository_firebase.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/data/repository/user/user_repository_firebase.dart';
import 'package:velotoulouse/main_common.dart';
import 'package:velotoulouse/service/auth/auth_service.dart';
import 'package:velotoulouse/service/booking/booking_service.dart';
import 'package:velotoulouse/service/subscription/subscription_service.dart';
import 'package:velotoulouse/ui/states/auth_state.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

List<InheritedProvider> get devProviders {
  return [
    // =========================
    // REPOSITORIES
    // =========================
    Provider<BookingRepository>(create: (_) => BookingRepositoryFirebase()),
    Provider<StationRepository>(create: (_) => StationRepositoryFirebase()),
    Provider<SlotRepository>(create: (_) => SlotRepositoryFirebase()),
    Provider<UserRepository>(create: (_) => UserRepositoryFirebase()),
    Provider<BikeRepository>(create: (_) => BikeRepositoryFirebase()),

    // =========================
    // SERVICES
    // =========================
    Provider<AuthService>(create: (_) => AuthService()),
    Provider<SubscriptionService>(
      create: (context) =>
          SubscriptionService(userRepository: context.read<UserRepository>()),
    ),

    Provider<BookingService>(
      create: (context) => BookingService(
        bookingRepository: context.read<BookingRepository>(),
        bikeRepository: context.read<BikeRepository>(),
        slotRepository: context.read<SlotRepository>(),
        stationRepository: context.read<StationRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
    ),

    // =========================
    // STATES
    // =========================
    ChangeNotifierProvider<AuthState>(
      create: (context) => AuthState(context.read<AuthService>()),
    ),

    ChangeNotifierProvider<UserState>(
      create: (context) =>
          UserState(context.read<UserRepository>(), context.read<AuthState>()),
    ),

    ChangeNotifierProvider<BookingState>(
      create: (context) => BookingState(
        service: context.read<BookingService>(),
        userId: context.read<AuthState>().userId!,
      )..startListening(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
