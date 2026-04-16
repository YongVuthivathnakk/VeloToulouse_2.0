import 'package:uuid/uuid.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:velotoulouse/models/user_subscription.dart';

class SubscriptionService {
  final UserRepository userRepository;
  SubscriptionService({required this.userRepository});

  Future<UserSubscription> createSubscription({
    required User user,
    required PassType passType,
  }) async {
    final subscription = UserSubscription(
      id: const Uuid().v4(),
      passType: passType,
      expirationDate: _calculateExpirationDate(passType),
    );

    final updatedUser = user.copyWith(
      userSubscription: subscription,
    );

    await userRepository.updateUser(updatedUser);

    return subscription; 
  }

  DateTime? _calculateExpirationDate(PassType type) {
    final now = DateTime.now();

    switch (type) {
      case PassType.oneTimeTicket:
        return null;

      case PassType.daily:
        return now.add(const Duration(days: 1));

      case PassType.monthly:
        return DateTime(now.year, now.month + 1, now.day);

      case PassType.yearly:
        return DateTime(now.year + 1, now.month, now.day);
    }
  }
}
