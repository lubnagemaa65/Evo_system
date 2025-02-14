import 'dart:convert';
import 'package:factory_task/models/roles/roles_model.dart';
import 'package:http/http.dart' as http;

class RoleController {
  final String apiUrl = 'http://192.168.1.4:8000/api';

  Future<List<Role>> getAllRoles(String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/getAllRoles'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Role.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }

  Future<Role> getRoleById(int id, String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/getRoleById/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Role.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load role');
    }
  }

  Future<void> changeRole(int userId, int roleId, String token) async {
    final response = await http.post(
      Uri.parse('$apiUrl/changeRole'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'userId': userId, 'roleId': roleId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to change role');
    }
  }
}
