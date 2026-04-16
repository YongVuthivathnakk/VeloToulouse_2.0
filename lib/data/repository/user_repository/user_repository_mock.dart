import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/user.dart';

class UserRepositoryMock implements UserRepository {
  final MockData mockData;
  UserRepositoryMock({required this.mockData});
  
  @override
  Future<User?> getUser() async {
    return mockData.userNoSubscription;
  }

  @override
  Future<User?> updateUser(User user) async {
    if (mockData.user.id != user.id) return null;
    mockData.user = user;
    return mockData.userNoSubscription;
  }
}
