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

  AsyncValue<String> passData = AsyncValue.success('');

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

  bool get isLoading => passData.state == AsyncValueState.loading;
  String? get errorMessage =>
      passData.state == AsyncValueState.error ? passData.error.toString() : null;

  Future<void> handlePassContent(PassType newPass) async {
    if (newPass == currentPass) return;
    
    passData = AsyncValue.loading();
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

      passData = AsyncValue.success('Pass updated successfully');
      notifyListeners();
    } catch (e) {
      passData = AsyncValue<String>.error(e);
      notifyListeners();
    }
  }

  void clearSuccess() {
    passData = AsyncValue.success('');
    notifyListeners();
  }
}


