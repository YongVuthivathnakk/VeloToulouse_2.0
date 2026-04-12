import 'package:velotoulouse/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<User?> updateUser(User user);
}
