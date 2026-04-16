import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/booking_view_data.dart';

class BookingService {
  final StationRepository stationRepo;
  final BookingRepository bookingRepo;

  BookingService({required this.stationRepo, required this.bookingRepo});

  Stream<BookingViewData?> watchCurrentBookingView(String userId) {
    return bookingRepo.watchCurrentBooking(userId).asyncMap((booking) async {
      if (booking == null || booking.bookingStatus != BookingStatus.reserved) {
        return null;
      }

      final station = await stationRepo.getStation(booking.stationId);
      if (station == null) return null;

      final slot = station.slots.firstWhere((s) => s.id == booking.slotId);

      return BookingViewData(
        stationName: station.name,
        stationLocation: station.location.street,
        slotNumber: slot.slotNumber,
        booking: booking,
      );
    });
  }
}
