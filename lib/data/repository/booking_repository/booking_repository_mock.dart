import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/models/booking.dart';

class BookingRepositoryMock implements BookingRepository {
  @override
  Future<Booking?> createBooking(Booking booking) async {
    return booking;
  }

  // This method is actually for US6
  @override
  Future<Booking?> updateBookingStatus(
    String bookingId,
    BookingStatus bookingStatus,
  ) {
    // TODO: implement updateBookingStatus
    throw UnimplementedError();
  }
}
