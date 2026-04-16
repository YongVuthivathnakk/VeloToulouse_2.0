import 'package:velotoulouse/models/booking.dart';

abstract class BookingRepository {
  Future<void> createBooking(String userId, Booking booking);
  Future<void> updateBooking(String userId, Booking booking);
  Stream<Booking?> watchCurrentBooking(String userId);
}
