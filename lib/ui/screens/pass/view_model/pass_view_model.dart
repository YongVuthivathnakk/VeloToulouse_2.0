import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/service/subscription/subscription_service.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class PassViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final UserState userState;
  final SubscriptionService passServcie;

  AsyncValue<String> data = AsyncValue.success('');

  PassViewModel({
    required this.userRepository,
    required this.userState,
    required this.passServcie,
  }) {
    userState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    userState.removeListener(notifyListeners);
    super.dispose();
  }

  PassType? get currentPass => userState.currentPass;
  User? get _currentUser => userState.user;

  bool get isLoading => data.state == AsyncValueState.loading;
  String? get errorMessage =>
      data.state == AsyncValueState.error ? data.error.toString() : null;

  Future<void> handlePassContent(PassType newPass) async {
    if (newPass == currentPass) return;
    
    data = AsyncValue.loading();
    notifyListeners();

    try {
      // Create new subscription and save to DB
      final newSubscription = await passServcie.createSubscription(
        user: _currentUser!,
        passType: newPass,
      );

      // Update UserState with new subscription
      final updatedUser = _currentUser!.copyWith(
        userSubscription: newSubscription,
      );
      await userState.updateUser(updatedUser);

      data = AsyncValue.success('Pass updated successfully');
      notifyListeners();
    } catch (e) {
      data = AsyncValue<String>.error(e);
      notifyListeners();
    }
  }
}


