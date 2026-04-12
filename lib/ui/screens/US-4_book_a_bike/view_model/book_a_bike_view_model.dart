import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';
import 'package:uuid/uuid.dart';


class BookABikeViewModel extends ChangeNotifier {
  final BookingRepository bookingRepository;
  final StationRepository stationRepository;
  final UserState userState;
  final String slotId;

  AsyncValue<Station> stationValue = AsyncValue.loading();
  AsyncValue<Booking> bookingValue = AsyncValue.loading();

  BookABikeViewModel({
    required this.bookingRepository,
    required this.stationRepository,
    required this.userState,
    required this.slotId,
  }) {
    _init();
  }

  Future<void> _init() async {
    try {
      final station = await stationRepository.getStationBySlotId(slotId);
      if (station != null) {
        stationValue = AsyncValue.success(station);
      } else {
        stationValue = AsyncValue.error('Station not found');
      }
    } catch (e) {
      stationValue = AsyncValue.error(e);
    }
    notifyListeners();
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
    } catch (e) {
      bookingValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
