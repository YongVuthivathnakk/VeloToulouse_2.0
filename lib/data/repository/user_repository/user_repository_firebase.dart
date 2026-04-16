import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:velotoulouse/data/dtos/user_dto.dart';
import 'package:velotoulouse/data/repository/user_repository/user_repository.dart';
import 'package:velotoulouse/models/user.dart';

class UserRepositoryFirebase implements UserRepository{
   static const _baseUrl =
      'velo-toulouse-ab88a-default-rtdb.asia-southeast1.firebasedatabase.app';
  @override
  Future<User?> getUser() async{
    final uri = Uri.https(_baseUrl, 'users/user_01.json');
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception("Failed to load user");
      }

      if (response.body == 'null') return null;

      final json = jsonDecode(response.body);

      return UserDto.fromJson('user_01', json);
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
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