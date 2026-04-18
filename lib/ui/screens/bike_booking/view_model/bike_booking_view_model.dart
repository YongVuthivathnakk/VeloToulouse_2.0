import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/booking_view_data.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/service/booking/booking_service.dart';
import 'package:velotoulouse/service/subscription/subscription_service.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class BikeBookingViewModel extends ChangeNotifier {
  final BookingService bookingService;
  final BookingState bookingState;
  final SubscriptionService subscriptionService;
  final UserState userState;
  final StationRepository stationRepository;

  BikeBookingViewModel({
    required this.bookingService,
    required this.subscriptionService,
    required this.userState,
    required this.stationRepository,
    required this.bookingState,
  });

  User? get user => userState.user;
  BookingViewData? get currentBooking => bookingState.currentBookingData;
  bool get hasActiveBooking => bookingState.hasBooking;

  Station? _station;
  Station? get station => _station;

  Future<void> init(Slot slot) async {
    _station = await stationRepository.getStation(slot.stationId);

    notifyListeners();
  }

  AsyncValue<Booking> bookingValue = AsyncValue.loading();

  Future<void> bookBike(BookingType type, Slot slot) async {
    final user = userState.user;
    if (user == null) return;

    bookingValue = AsyncValue.loading();
    notifyListeners();

    try {
      final booking = await bookingService.bookBike(
        userId: user.id,
        slot: slot,
        bookingType: type,
      );

      // final updatedUser = user.copyWith(bookedBike: booking);
      // await userState.updateUser(updatedUser);

      bookingValue = AsyncValue.success(booking);
    } catch (e) {
      bookingValue = AsyncValue.error(e);
    }

    notifyListeners();
  }

  Future<void> buyOneTimeTicket() async {
    final user = userState.user;
    if (user == null) return;

    final subscription = await subscriptionService.createSubscription(
      user: user,
      passType: PassType.oneTimeTicket,
    );

    await userState.updateUser(user.copyWith(userSubscription: subscription));

    notifyListeners();
  }
}
