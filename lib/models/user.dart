import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/user_subscription.dart';

class User {
  final String id;
  final String name;
  final UserSubscription? userSubscription;
  //final Booking? bookedBike;

  User({
    required this.id,
    required this.name,
    this.userSubscription,
    //this.bookedBike,
  });

  User copyWith({
    String? name,
    UserSubscription? userSubscription,
    Booking? bookedBike,
    bool clearSubscription = false,
    //bool clearBooking = false,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      userSubscription: clearSubscription
          ? null
          : userSubscription ?? this.userSubscription,
      //bookedBike: clearBooking ? null : bookedBike ?? this.bookedBike,
    );
  }
}
