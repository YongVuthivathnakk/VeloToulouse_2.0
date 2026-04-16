import 'package:velotoulouse/models/booking.dart';

class BookingDto {
  static const String idKey = 'id';
  static const String bookingTimeKey = 'bookingTime';
  static const String bookingStatusKey = 'bookingStatus';
  static const String bookingTypeKey = 'bookingType';
  static const String slotIdKey = 'slotId';

  static Booking fromJson(String id, Map<dynamic, dynamic> json) {
    return Booking(
      id: id,
      bookingTime: DateTime.parse(json[bookingTimeKey]),
      bookingStatus: BookingStatus.values.byName(json[bookingStatusKey]),
      bookingType: BookingType.values.byName(json[bookingTypeKey]),
      slotId: json[slotIdKey],
    );
  }

  static Map<String, dynamic> toJson(Booking booking) {
    return {
      idKey: booking.id,
      bookingTimeKey: booking.bookingTime.toIso8601String(),
      bookingStatusKey: booking.bookingStatus.name,
      bookingTypeKey: booking.bookingType.name,
      slotIdKey: booking.slotId,
    };
  }
}
