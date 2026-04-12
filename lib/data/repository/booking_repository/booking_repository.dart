import 'package:velotoulouse/models/booking.dart';

abstract class BookingRepository {
  Future<Booking?> createBooking(Booking booking);
  Future<Booking?> updateBookingStatus(String bookingId, BookingStatus bookingStatus);
}
