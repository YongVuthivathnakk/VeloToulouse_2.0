import 'package:velotoulouse/data/dtos/booking_dto.dart';
import 'package:velotoulouse/data/dtos/user_subscription_dto.dart';
import 'package:velotoulouse/models/user.dart';

class UserDto {
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String userSubscriptionKey = 'userSubscription';
  static const String bookedBikeKey = 'bookedBike';

  static User fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[nameKey] is String);
    return User(
      id: id,
      name: json[nameKey],
      userSubscription: json[userSubscriptionKey] != null
          ? UserSubscriptionDto.fromJson(
              json[userSubscriptionKey]['id'],
              json[userSubscriptionKey],
            )
          : null,
      bookedBike: json[bookedBikeKey] != null
          ? BookingDto.fromJson(json[bookedBikeKey]['id'], json[bookedBikeKey])
          : null,
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      nameKey: user.name,
      userSubscriptionKey: user.userSubscription != null
          ? UserSubscriptionDto.toJson(user.userSubscription!)
          : null,
      bookedBikeKey: user.bookedBike != null
          ? BookingDto.toJson(user.bookedBike!)
          : null,
    };
  }
}
