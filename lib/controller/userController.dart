import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/users/userModel.dart';

class UserController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = false.obs;

  final String baseUrl = 'http://192.168.1.4:8000/api'; // Unified API URL

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // 🔹 Get All Users
  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('$baseUrl/getAllUsers'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        userList.value = data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch users: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }

  // 🔹 Add User
  Future<void> addUser(UserModel user) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/addUser'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 201) {
        fetchUsers(); // Refresh user list
        Get.snackbar("Success", "User added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add user");
      }
    } catch (e) {
      Get.snackbar("Error", "Error adding user: $e");
    }
  }

  // 🔹 Update User
  Future<void> updateUser(int userId, UserModel updatedUser) async {
    try {
      var response = await http.put(
        Uri.parse('$baseUrl/updateUser/$userId'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedUser.toJson()),
      );

      if (response.statusCode == 200) {
        fetchUsers(); // Refresh user list
        Get.snackbar("Success", "User updated successfully!");
      } else {
        Get.snackbar("Error", "Failed to update user");
      }
    } catch (e) {
      Get.snackbar("Error", "Error updating user: $e");
    }
  }

  // 🔹 Delete User
  Future<void> deleteUser(int userId) async {
    try {
      var response =
          await http.delete(Uri.parse('$baseUrl/deleteUser/$userId'));

      if (response.statusCode == 200) {
        fetchUsers(); // Refresh user list after deletion
        Get.snackbar("Success", "User deleted successfully!");
      } else {
        Get.snackbar("Error", "Failed to delete user");
      }
    } catch (e) {
      Get.snackbar("Error", "Error deleting user: $e");
    }
  }

  // 🔹 Search User
  Future<void> searchUser(String query) async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('$baseUrl/searchUser?query=$query'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        userList.value = data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        Get.snackbar("Error", "Failed to search users");
      }
    } catch (e) {
      Get.snackbar("Error", "Error searching users: $e");
    } finally {
      isLoading(false);
    }
  }
}
