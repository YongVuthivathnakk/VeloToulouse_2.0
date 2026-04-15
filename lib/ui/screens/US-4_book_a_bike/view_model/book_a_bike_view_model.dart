import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/service/booking_service.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';
import 'package:uuid/uuid.dart';

class BookABikeViewModel extends ChangeNotifier {
  // final BookingRepository bookingRepository;
  final BookingService bookingService;
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

      await userState.updateUser(user.copyWith(bookedBike: booking));

      bookingValue = AsyncValue.success(booking);

      final updatedUser = userState.currentUser;

      print('=== Updated User ===');
      print('id: ${updatedUser?.id}');
      print('bookedBike: ${updatedUser?.bookedBike?.id}');
      print('slotId: ${updatedUser?.bookedBike?.slotId}');
      print('====================');
    } catch (e) {
      bookingValue = AsyncValue.error(e);
    }

    notifyListeners();
  }
}
