import 'package:firebase_database/firebase_database.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/data/dtos/booking_dto.dart';

class BookingRepositoryFirebase implements BookingRepository {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  @override
  Stream<Booking?> watchCurrentBooking(String userId) {
    final ref = _db.child('bookings/$userId');

    return ref.onValue.map((event) {
      final data = event.snapshot.value;

      if (data == null) return null;

      final map = Map<String, dynamic>.from(data as Map);

      for (var entry in map.entries) {
        final booking = BookingDto.fromJson(userId, entry.value);

        if (booking.bookingStatus == BookingStatus.reserved) {
          return booking;
        }
      }

      return null;
    });
  }

  @override
  Future<void> createBooking(String userId, Booking booking) async {
    final ref = _db.child('bookings/$userId');

    await ref.push().set(BookingDto.toJson(booking));
  }

  @override
  Future<void> updateBooking(String userId, Booking booking) async {
    final ref = _db.child('bookings/$userId/${booking.id}');

    await ref.update(BookingDto.toJson(booking));
  }
}
