import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:velotoulouse/data/dtos/booking_dto.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/models/booking.dart';

class BookingRepositoryFirebase implements BookingRepository {
  static const _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';
  @override
  Future<Booking?> createBooking(Booking booking) async {
    final uri = Uri.https(_baseUrl, 'bookings/${booking.id}.json');

    try {
      final response = await http.put(
        uri,
        body: jsonEncode(BookingDto.toJson(booking)),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to create booking: ${response.statusCode}");
      }

      return booking; 
    } catch (e) {
      throw Exception("Error creating booking: $e");
    }
  }

  @override
  Future<Booking?> updateBookingStatus(
    String bookingId,
    BookingStatus bookingStatus,
  ) {
    // TODO: implement updateBookingStatus
    throw UnimplementedError();
  }
}
