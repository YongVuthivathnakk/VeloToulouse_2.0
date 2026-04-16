import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/models/user.dart';
import 'package:velotoulouse/ui/states/auth_state.dart';

class UserState extends ChangeNotifier {
  final UserRepository userRepo;
  final AuthState authState;

  User? user;

  UserState(this.userRepo, this.authState);

  Future<void> loadUser() async {
    final id = authState.userId;
    if (id == null) return;

    user = await userRepo.getUser(id);
    notifyListeners();
  }
}
