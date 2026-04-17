// import 'package:velotoulouse/data/mockdata.dart';
// import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
// import 'package:velotoulouse/models/booking.dart';

// class BookingRepositoryMock implements BookingRepository {
//   final MockData mockData;
//   BookingRepositoryMock({required this.mockData});
//   @override
//   Future<Booking?> createBooking(Booking booking) async {
//     mockData.bookings.add(booking);
//     return booking;
//   }

//   // This method is actually for US6
//   @override
//   Future<Booking?> updateBookingStatus(
//     String bookingId,
//     BookingStatus bookingStatus,
//   ) {
//     // TODO: implement updateBookingStatus
//     throw UnimplementedError();
//   }
  
//   @override
//   Stream<Booking?> watchCurrentBooking(String userId) {
//     // TODO: implement watchCurrentBooking
//     throw UnimplementedError();
//   }
// }
