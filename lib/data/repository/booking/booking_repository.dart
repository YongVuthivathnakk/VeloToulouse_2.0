import 'package:velotoulouse/models/booking.dart';

abstract class BookingRepository {
  Future<Booking?> createBooking(String userId, Booking booking);
  Future<Booking?> updateBookingStatus(
    String bookingId,
    BookingStatus bookingStatus,
  );
  Stream<Booking?> watchCurrentBooking(String userId);
}
