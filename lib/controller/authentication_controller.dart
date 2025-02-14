import 'dart:convert';
import 'package:factory_task/models/authentication_Model/authentication_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  var isLoading = false.obs;
  var authModel = AuthModel().obs; // To store authenticated user info

  // Base URL of your API
  final String baseUrl = "http://192.168.1.4:8000/api";

  // 🔹 Login Method
  Future<void> login(String username, String password) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        authModel.value = AuthModel.fromJson(data); // Store user data
        Get.offAllNamed('/home'); // Navigate to Home Page
        Get.snackbar("Success", "Login successful!",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Login failed. Check credentials.");
      }
    } catch (e) {
      Get.snackbar("Error", "Login error: $e");
    } finally {
      isLoading(false);
    }
  }

  // 🔹 Register Method
  Future<void> register(String username, String email, String password) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"username": username, "email": email, "password": password}),
      );

      if (response.statusCode == 201) {
        Get.offAllNamed('/home'); // Navigate to Home Page after registration
        Get.snackbar("Success", "Registration successful!",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Registration failed. Try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "Registration error: $e");
    } finally {
      isLoading(false);
    }
  }

  // 🔹 Logout Method
  Future<void> logout() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        authModel.value = AuthModel(); // Clear user data
        Get.offAllNamed('/login'); // Navigate to Login Page
        Get.snackbar("Success", "Logged out successfully!",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Logout failed. Try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "Logout error: $e");
    } finally {
      isLoading(false);
    }
  }
}
