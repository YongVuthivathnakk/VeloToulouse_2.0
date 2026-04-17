import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/data/dtos/user_dto.dart';
import 'package:velotoulouse/models/user.dart';

class UserRepositoryFirebase extends UserRepository {
  static const String _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';

  @override
  Future<User> getUser(String id) async {
    final uri = Uri.https(_baseUrl, 'users/$id.json');

    final response = await http.get(uri);

    if (response.statusCode != 200 || response.body == 'null') {
      throw Exception('User not found');
    }

    final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    return UserDto.fromJson(id, data);
  }

  @override
  Future<User?> updateUser(User user) async {
    final uri = Uri.https(_baseUrl, 'users/${user.id}.json');
    try {
      final data = UserDto.toJson(user);

      print("SENDING TO FIREBASE:");
      print(data);
      final response = await http.put(
        uri,
        body: jsonEncode(UserDto.toJson(user)),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to update user");
      }

      final json = jsonDecode(response.body);

      return UserDto.fromJson(user.id, json);
    } catch (e) {
      throw Exception("Error updating user: $e");
    }
  }
}
