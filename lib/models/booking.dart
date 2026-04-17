enum BookingStatus { reserved, active, completed }

enum BookingType { pass, ticket }

class Booking {
  final String id;
  final String userId;
  final DateTime bookingTime;
  final BookingStatus bookingStatus;
  final BookingType bookingType;
  final String stationId;
  final String slotId;

  Booking({
    required this.id,
    required this.userId,
    required this.bookingTime,
    required this.bookingStatus,
    required this.bookingType,
    required this.stationId,
    required this.slotId,
  });

  Booking copyWith({
    String? userId,
    DateTime? bookingTime,
    BookingStatus? bookingStatus,
    BookingType? bookingType,
    String? stationId,
    String? slotId,
  }) {
    return Booking(
      id: id,
      userId: userId ?? this.userId,
      bookingTime: bookingTime ?? this.bookingTime,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      bookingType: bookingType ?? this.bookingType,
      stationId: stationId ?? this.stationId,
      slotId: slotId ?? this.slotId,
    );
  }
}
