import 'package:velotoulouse/data/dtos/booking_dto.dart';
import 'package:velotoulouse/data/dtos/user_subscription_dto.dart';
import 'package:velotoulouse/models/user.dart';

class UserDto {
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String userSubscriptionKey = 'userSubscription';
  //static const String bookedBikeKey = 'currentBooking';

  static User fromJson(String id, Map<dynamic, dynamic> json) {
    final subscriptionJson = json[userSubscriptionKey];
   // final bookingJson = json[bookedBikeKey];

    return User(
      id: id,
      name: json[nameKey] as String? ?? '',
      userSubscription: subscriptionJson is Map<String, dynamic>
          ? UserSubscriptionDto.fromJson(
              subscriptionJson['id'] ?? '',
              subscriptionJson,
            )
          : null,
      // currentBooking: bookingJson is Map<String, dynamic>
      //     ? BookingDto.fromJson(bookingJson['id'] ?? '', bookingJson)
      //     : null,
    );
  }

  static Map<String, dynamic> toJson(User user) {
    final map = <String, dynamic>{
      nameKey: user.name,
      // bookedBikeKey: user.currentBooking != null
      //     ? BookingDto.toJson(user.currentBooking!)
      //     : null,
    };

    if (user.userSubscription != null) {
      map[userSubscriptionKey] = UserSubscriptionDto.toJson(
        user.userSubscription!,
      );
    }

    return map;
  }
}
