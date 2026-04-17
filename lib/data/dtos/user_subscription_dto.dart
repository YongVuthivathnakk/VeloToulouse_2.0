import 'package:velotoulouse/models/user_subscription.dart';

class UserSubscriptionDto {
  static const String idKey = 'id';
  static const String expirationDateKey = 'expirationDate';
  static const String passTypeKey = 'passType';

  static UserSubscription fromJson(String id, Map<dynamic, dynamic> json) {
    // assert(json[passTypeKey] is String);
    return UserSubscription(
      id: id,
      expirationDate: json[expirationDateKey] != null
          ? DateTime.parse(json[expirationDateKey])
          : null,      
      passType: PassType.values.byName(json[passTypeKey]),
    );
  }

  static Map<String, dynamic> toJson(UserSubscription userSubscription) {
    return {
      expirationDateKey: userSubscription.expirationDate?.toIso8601String(),
      passTypeKey: userSubscription.passType.name,
    };
  }
}
