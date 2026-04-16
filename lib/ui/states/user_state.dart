import 'package:flutter/widgets.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/user.dart';

class UserState extends ChangeNotifier {
  final UserRepository userRepository;
  User? _currentUser;

  UserState({required this.userRepository}) {
    _init();
  }

  User? get currentUser => _currentUser;

  Future<void> _init() async {
    try {
      final user = await userRepository.getUser();
      if (user != null) {
        _currentUser = user;
      }
    } catch (e) {
      print('Error loading user: $e');
    }
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    try {
      await userRepository.updateUser(user);
      _currentUser = user;
    } catch (e) {
      print('Error updating user: $e');
    }

    notifyListeners();
  }
}
