import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/data/repository/booking_repository/booking_repository.dart';
import 'package:velotoulouse/data/repository/slot_repository/slot_repository.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:uuid/uuid.dart';
import 'package:velotoulouse/models/user_subscription.dart';

class BookingService {
  final BookingRepository bookingRepository;
  final BikeRepository bikeRepository;
  final SlotRepository slotRepository;
  final UserRepository userRepository;

  BookingService({
    required this.bookingRepository,
    required this.bikeRepository,
    required this.slotRepository,
    required this.userRepository, 
  });

  Future<Booking?> bookBike({
    required User user,
    required String slotId,
    required BookingType bookingType,
  }) async {
    final slot = await slotRepository.getSlotById(slotId);

    if (slot == null || slot.bikeId == null) {
      throw Exception("No bike available in this slot");
    }
    final bikeId = slot.bikeId!;

    final bike = await bikeRepository.getBike(bikeId);

    if (bike == null || !bike.isAvailable) {
      throw Exception("Bike is not available");
    }

    final booking = Booking(
      id: Uuid().v4(),
      bookingTime: DateTime.now(),
      bookingStatus: BookingStatus.reserved,
      bookingType: bookingType,
      slotId: slotId,
    );

    final createdBooking = await bookingRepository.createBooking(booking);
    if (createdBooking == null) return null;

    await bikeRepository.updateBikeAvailability(bikeId, false);

    User updatedUser = user.copyWith(bookedBike: createdBooking);

    if (user.userSubscription?.passType == PassType.oneTimeTicket) {
      updatedUser = updatedUser.copyWith(clearSubscription: true);
    }
    print("updateUser CALLED");
    await userRepository.updateUser(updatedUser);


    return createdBooking;
  }
}
