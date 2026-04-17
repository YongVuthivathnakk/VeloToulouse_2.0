import 'package:uuid/uuid.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/booking/booking_repository.dart';
import 'package:velotoulouse/data/repository/slot/slot_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/booking_view_data.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';

class BookingService {
  final BookingRepository bookingRepository;
  final BikeRepository bikeRepository;
  final SlotRepository slotRepository;
  final StationRepository stationRepository;
  final UserRepository userRepository;

  BookingService({
    required this.bookingRepository,
    required this.bikeRepository,
    required this.slotRepository,
    required this.stationRepository,
    required this.userRepository, 
  });

  Future<Booking> bookBike({
    required String userId,
    required Slot slot,
    required BookingType bookingType,
  }) async {
    final bikeId = slot.bikeId;

    if (bikeId == null) {
      throw Exception("Slot is empty");
    }

    final bike = await bikeRepository.getBike(bikeId);

    if (bike == null || !bike.isAvailable) {
      throw Exception("Bike is not available");
    }

    final booking = Booking(
      id: const Uuid().v4(),
      userId: userId,
      bookingTime: DateTime.now(),
      bookingStatus: BookingStatus.reserved,
      bookingType: bookingType,
      stationId: slot.stationId,
      slotId: slot.id,
    );

    await bookingRepository.createBooking(userId, booking);
    await bikeRepository.updateBikeAvailability(bikeId, false);

    return booking;
  }

  Stream<BookingViewData?> watchCurrentBookingView(String userId) {
    return bookingRepository.watchCurrentBooking(userId).asyncMap((
      booking,
    ) async {
      if (booking == null || booking.bookingStatus != BookingStatus.reserved) {
        return null;
      }

      final station = await stationRepository.getStation(booking.stationId);

      if (station == null) return null;

      final slot = station.slots.firstWhere((s) => s.id == booking.slotId);

      return BookingViewData(
        stationName: station.name,
        stationLocation: station.location.street,
        slotNumber: slot.slotNumber,
        booking: booking,
      );
    });
  }

  Map<String, int> computeAvailableBikeCounts(
    List<Station> stations,
    List<Bike> bikes,
  ) {
    final bikeMap = {for (var b in bikes) b.id: b};

    final result = <String, int>{};

    for (var station in stations) {
      int count = 0;

      for (var slot in station.slots) {
        final bike = bikeMap[slot.bikeId];
        if (bike != null && bike.isAvailable) {
          count++;
        }
      }

      result[station.id] = count;
    }

    return result;
  }
}
