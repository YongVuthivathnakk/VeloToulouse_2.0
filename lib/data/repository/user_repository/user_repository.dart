import 'package:velotoulouse/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser(String id);
  Future<User?> updateUser(User user);
}
