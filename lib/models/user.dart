import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/user_subscription.dart';

class User {
  final String id;
  final String name;
  final UserSubscription? userSubscription;
  //final Booking? currentBooking;

  User({
    required this.id,
    required this.name,
    this.userSubscription,
    //this.currentBooking,
  });

  User copyWith({
    String? name,
    UserSubscription? userSubscription,
    Booking? bookedBike,
    bool clearSubscription = false,
    bool clearBooking = false,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      userSubscription: clearSubscription
          ? null
          : userSubscription ?? this.userSubscription,
      //currentBooking: clearBooking ? null : bookedBike ?? this.currentBooking,
    );
  }

  bool get hasValidSubscription =>
      userSubscription != null && !userSubscription!.isExpired;

  //bool get hasActiveBooking => currentBooking != null;

  //bool get canBook => hasValidSubscription && !hasActiveBooking;
}
