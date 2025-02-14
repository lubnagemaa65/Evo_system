import 'dart:convert';
import 'package:factory_task/models/admins/admin_model.dart';
import 'package:http/http.dart' as http;

class AdminController {
  final String baseUrl = 'http://192.168.1.4/:8000/api';

  Future<List<Admin>> getAllAdmins(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getAllAdmins'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((admin) => Admin.fromJson(admin)).toList();
    } else {
      throw Exception('Failed to load admins');
    }
  }

  Future<Admin> addAdmin(String token, Admin admin) async {
    final response = await http.post(
      Uri.parse('$baseUrl/addAdmin'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(admin.toJson()),
    );

    if (response.statusCode == 201) {
      return Admin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add admin');
    }
  }

  Future<Admin> updateAdmin(String token, int id, Admin admin) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateAdmin/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(admin.toJson()),
    );

    if (response.statusCode == 200) {
      return Admin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update admin');
    }
  }

  Future<void> deleteAdmin(String token, int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/deleteAdmin/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete admin');
    }
  }

  Future<Admin> getAdminById(String token, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getAdminById/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Admin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load admin');
    }
  }
}
