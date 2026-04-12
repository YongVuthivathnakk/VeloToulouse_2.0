import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/user.dart';

class UserRepositoryMock implements UserRepository {
  User _user = MockData.user;
  @override
  Future<User?> getUser(String id) async {
    if (_user.id != id) return null;
    return _user;
  }

  @override
  Future<User?> updateUser(User user) async {
    if (_user.id == user.id) return null;
    _user = user;
    return _user;
  }
}
