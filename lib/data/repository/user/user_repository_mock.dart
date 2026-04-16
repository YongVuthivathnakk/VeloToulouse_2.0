import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/models/user.dart';

class UserRepositoryMock implements UserRepository {

  @override
  Future<User> getUser(String id) async {
    return MockData.user;
  }
}
