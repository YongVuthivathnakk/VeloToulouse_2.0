import 'package:velotoulouse/models/booking.dart';

class BookingViewData {
  final String stationName;
  final int slotNumber;
  final Booking booking;
  final String? stationLocation; 

  BookingViewData({
    required this.stationName,
    required this.slotNumber,
    required this.booking,
    this.stationLocation,
  });
}
