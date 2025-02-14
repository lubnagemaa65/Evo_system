import 'package:factory_task/models/Maintain_Request/maintain_Request_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MaintenanceRequestController {
  final String baseUrl = 'http://192.168.1.4:8000/api';

  // Method to send a maintenance request
  Future<void> sendMaintenanceRequest(MaintenanceRequest request) async {
    final url = Uri.parse('$baseUrl/sentMaintenanceRequest');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_TOKEN',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      // Request was successful
    } else {
      // Handle error
    }
  }

  // Method to fetch all maintenance requests
  Future<List<MaintenanceRequest>> getAllMaintenanceRequests() async {
    final url = Uri.parse('$baseUrl/getAllMaintenanceRequests');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => MaintenanceRequest.fromJson(json)).toList();
    } else {
      // Handle error
      return [];
    }
  }

  // Method to delete a maintenance request by ID
  Future<void> deleteMaintenanceRequest(int id) async {
    final url = Uri.parse('$baseUrl/deleteMaintenanceRequest/$id');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
      },
    );

    if (response.statusCode == 200) {
      // Deletion was successful
    } else {
      // Handle error
    }
  }
}
