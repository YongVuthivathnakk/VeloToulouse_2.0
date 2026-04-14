import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';
import 'package:uuid/uuid.dart';

class BookABikeViewModel extends ChangeNotifier {
  final BookingRepository bookingRepository;
  final StationState stationState;
  final UserState userState;
  final String slotId;

  AsyncValue<Booking> bookingValue = AsyncValue.loading();

  Slot? get slot => stationState.selectedStation?.slots
      .where((s) => s.id == slotId)
      .firstOrNull;

  BookABikeViewModel({
    required this.bookingRepository,
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
      final booking = Booking(
        id: Uuid().v4(),
        bookingTime: DateTime.now(),
        bookingStatus: BookingStatus.reserved,
        bookingType: bookingType,
        slotId: slotId,
      );

      final createdBooking = await bookingRepository.createBooking(booking);
      if (createdBooking == null) {
        bookingValue = AsyncValue.error('Failed to create booking');
        notifyListeners();
        return;
      }
      await userState.updateUser(user.copyWith(bookedBike: createdBooking));
      bookingValue = AsyncValue.success(createdBooking);
      final updatedUser = userState.currentUser;
      print('=== Updated User ===');
      print('id: ${updatedUser?.id}');
      print('name: ${updatedUser?.name}');
      print('bookedBike: ${updatedUser?.bookedBike?.id}');
      print('bookedBike status: ${updatedUser?.bookedBike?.bookingStatus}');
      print('bookedBike type: ${updatedUser?.bookedBike?.bookingType}');
      print('bookedBike slotId: ${updatedUser?.bookedBike?.slotId}');
      print('bookedBike time: ${updatedUser?.bookedBike?.bookingTime}');
      print('subscription: ${updatedUser?.userSubscription?.passType}');
      print('====================');
    } catch (e) {
      bookingValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
