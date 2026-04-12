enum BookingStatus { reserved, active, completed }

enum BookingType { pass, ticket }

class Booking {
  final String id;
  final DateTime bookingTime;
  final BookingStatus bookingStatus;
  final BookingType bookingType;
  final String slotId;

  Booking({
    required this.id,
    required this.bookingTime,
    required this.bookingStatus,
    required this.bookingType,
    required this.slotId,
  });

  Booking copyWith({
    DateTime? bookingTime,
    BookingStatus? bookingStatus,
    BookingType? bookingType,
    String? slotId,
  }) {
    return Booking(
      id: id,
      bookingTime: bookingTime ?? this.bookingTime,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      bookingType: bookingType ?? this.bookingType,
      slotId: slotId ?? this.slotId,
    );
  }
}
