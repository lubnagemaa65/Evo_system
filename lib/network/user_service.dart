import 'dart:convert';
import 'package:factory_task/models/users/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'http://192.168.1.4:8000/api';

  // Add User
  Future<void> addUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addUser'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        print("User added successfully");
      } else {
        print("Failed to add user: ${response.body}");
      }
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  // Update User
  Future<void> updateUser(String userId, UserModel user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/updateUser/$userId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        print("User updated successfully");
      } else {
        print("Failed to update user: ${response.body}");
      }
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // Get All Users
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getAllUsers'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((userJson) => UserModel.fromJson(userJson)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      print("Error fetching users: $e");
      throw Exception("Failed to load users");
    }
  }

  // Get User by ID
  Future<UserModel> getUserById(String userId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/getUserById/$userId'));

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print("Error fetching user: $e");
      throw Exception("User not found");
    }
  }

  // Delete User
  Future<void> deleteUser(String userId) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/deleteUser/$userId'));

      if (response.statusCode == 200) {
        print("User deleted successfully");
      } else {
        print("Failed to delete user: ${response.body}");
      }
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  // Search User
  Future<List<UserModel>> searchUser(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/searchUser?q=$query'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((userJson) => UserModel.fromJson(userJson)).toList();
      } else {
        throw Exception("Failed to search users");
      }
    } catch (e) {
      print("Error searching users: $e");
      throw Exception("Failed to search users");
    }
  }
}
