import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/models/booking.dart';

class BookingRepositoryMock implements BookingRepository {
  
  final MockData mockData;
  BookingRepositoryMock({required this.mockData});
  
  final _bookingController = StreamController<List<Booking?>>.broadcast();

  // This method is actually for US6
  @override
  Future<Booking?> updateBookingStatus(
    String bookingId,
    BookingStatus bookingStatus,
  ) {
    // TODO: implement updateBookingStatus
    throw UnimplementedError();
  }
  
  @override
  Future<Booking?> createBooking(String userId, Booking booking) async {
    mockData.bookings.add(booking);

    _bookingController.add(List.from(mockData.bookings)); 

    return booking;
  }
  
  @override
  Stream<Booking?> watchCurrentBooking(String userId) {
    return _bookingController.stream.map((bookings) {
      return bookings
          .where(
            (b) =>
                b!.userId == userId && b.bookingStatus == BookingStatus.reserved,
          )
          .lastOrNull;
    });
  }
}
