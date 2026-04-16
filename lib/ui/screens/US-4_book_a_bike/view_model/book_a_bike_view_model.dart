import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/service/booking_service.dart';
import 'package:velotoulouse/service/subscription_service.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';
import 'package:uuid/uuid.dart';

class BookABikeViewModel extends ChangeNotifier {
  // final BookingRepository bookingRepository;
  final BookingService bookingService;
  final SubscriptionService subscriptionService;
  final StationState stationState;
  final UserState userState;
  final String slotId;

  AsyncValue<Booking> bookingValue = AsyncValue.loading();

  Slot? get slot => stationState.selectedStation?.slots
      .where((s) => s.id == slotId)
      .firstOrNull;

  BookABikeViewModel({
    // required this.bookingRepository,
    required this.bookingService,
    required this.subscriptionService,
    required this.stationState,
    required this.userState,
    required this.slotId, 
  }) {
    stationState.addListener(notifyListeners);
    userState.addListener(notifyListeners);
  }

  Future<void> bookBike(BookingType bookingType) async {
    final user = userState.currentUser;

    if (user == null) return;

    bookingValue = AsyncValue.loading();
    notifyListeners();

    try {
      final booking = await bookingService.bookBike(
        user: user,
        slotId: slotId,
        bookingType: bookingType,
      );

      if (booking == null) {
        bookingValue = AsyncValue.error('Failed to create booking');
        notifyListeners();
        return;
      }

      bookingValue = AsyncValue.success(booking);

      // final updatedUser = user.copyWith(bookedBike: booking);
      // await userState.updateUser(updatedUser);
      // await stationState.refreshSelectedStation();
      await stationState.refreshAll();
      final current = userState.currentUser;
      print('=== Booking Verification ===');

      print('--- Booking ---');
      print('Booking ID: ${booking.id}');
      print('Booking status: ${booking.bookingStatus}');
      print('Booking type: ${booking.bookingType}');
      print('Booking time: ${booking.bookingTime}');
      print('Slot ID: ${booking.slotId}');

      print('--- User ---');
      print('User ID: ${current?.id}');
      print('User name: ${current?.name}');
      print('bookedBike ID: ${current?.bookedBike?.id}');
      print('bookedBike slotId: ${current?.bookedBike?.slotId}');

      print('============================');
    } catch (e) {
      bookingValue = AsyncValue.error(e);
    }

    notifyListeners();
  }
  Future<void> buyOneTimeTicket() async {
    final user = userState.currentUser;
    if (user == null) return;

    try {
      final subscription = await subscriptionService.createSubscription(
        user: user,
        passType: PassType.oneTimeTicket,
      );

      final updatedUser = user.copyWith(userSubscription: subscription);

      await userState.updateUser(updatedUser);

      final current = userState.currentUser;

      print('=== Subscription Verification ===');

      print('--- Subscription ---');
      print('ID: ${subscription.id}');
      print('Type: ${subscription.passType}');
      print('Expiration: ${subscription.expirationDate}');
      print('Is Expired: ${subscription.isExpired}');

      print('--- User ---');
      print('User ID: ${current?.id}');
      print('User name: ${current?.name}');
      print('Has subscription: ${current?.userSubscription != null}');
      print('User subscription ID: ${current?.userSubscription?.id}');
      print('User subscription type: ${current?.userSubscription?.passType}');

      print('===============================');
    } catch (e) {
      print("Error buying ticket: $e");
    }

    notifyListeners();
  }
}
