import 'package:provider/provider.dart';
// import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
// import 'package:velotoulouse/data/repository/bike/bike_repository_mock.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository_firebase.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository_firebase.dart';
import 'package:velotoulouse/data/repository/station/station_repository_mock.dart';
import 'package:velotoulouse/data/repository/user/user_repository_firebase.dart';
import 'package:velotoulouse/main_common.dart';
import 'package:velotoulouse/service/auth/auth_service.dart';
import 'package:velotoulouse/service/booking/booking_service.dart';
import 'package:velotoulouse/ui/states/auth_state.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

List<InheritedProvider> get devProviders {
  return [
    // Provider<BikeRepository>(create: (_) => BikeRepositoryMock()),
    Provider<BookingRepository>(create: (_) => BookingRepositoryFirebase()),
    //Provider<StationRepository>(create: (_) => StationRepositoryMock()),
    Provider<StationRepository>(create: (_) => StationRepositoryFirebase()),
    Provider<AuthService>(create: (_) => AuthService()),
    ChangeNotifierProvider<AuthState>(
      create: (context) => AuthState(context.read<AuthService>()),
    ),
    ChangeNotifierProvider<UserState>(
      create: (context) =>
          UserState(UserRepositoryFirebase(), context.read<AuthState>()),
    ),
    // ChangeNotifierProvider<StationState>(
    //   create: (context) =>
    //       StationState(stationRepository: context.read<StationRepository>()),
    // ),
    ChangeNotifierProvider<BookingState>(
      create: (context) => BookingState(
        service: BookingService(
          stationRepo: context.read<StationRepository>(),
          bookingRepo: context.read<BookingRepository>(),
        ),
        userId: context.read<AuthState>().userId!,
      )..startListening(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
