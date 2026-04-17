import 'package:velotoulouse/models/booking.dart';

class BookingDto {
  static const String idKey = 'id';
  static const String userIdKey = 'userId';
  static const String bookingTimeKey = 'bookingTime';
  static const String bookingStatusKey = 'bookingStatus';
  static const String bookingTypeKey = 'bookingType';
  static const String stationIdKey = 'stationId';
  static const String slotIdKey = 'slotId';

  static Booking fromJson(String id, Map<dynamic, dynamic> json) {
    return Booking(
      id: id,
      userId: json[userIdKey],
      bookingTime: DateTime.parse(json[bookingTimeKey]),
      bookingStatus: BookingStatus.values.byName(json[bookingStatusKey]),
      bookingType: BookingType.values.byName(json[bookingTypeKey]),
      stationId: json[stationIdKey],
      slotId: json[slotIdKey],
    );
  }

  static Map<String, dynamic> toJson(Booking booking) {
    return {
      idKey: booking.id,
      userIdKey: booking.userId, 
      bookingTimeKey: booking.bookingTime.toIso8601String(),
      bookingStatusKey: booking.bookingStatus.name,
      bookingTypeKey: booking.bookingType.name,
      stationIdKey: booking.stationId,
      slotIdKey: booking.slotId,
    };
  }
}
