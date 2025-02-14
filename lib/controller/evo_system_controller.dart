// controllers/evo_system_controller.dart
import 'package:factory_task/models/evo_system/evo_system_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EvoSystemController extends GetxController {
  var evoSystems = <EvoSystem>[].obs;
  var isLoading = false.obs;
  final String baseUrl = 'http://192.168.1.4/:8000/api';
  final String authToken =
      'Bearer 1|V1x7OwX6i4DWCNI8rWkuO0LQh0pGie1e7ZO2TmZe2bf1bb03';

  @override
  void onInit() {
    super.onInit();
    fetchAllEvoSystems();
  }

  // Fetch all EvoSystems
  Future<void> fetchAllEvoSystems() async {
    isLoading.value = true;
    final response = await http.get(
      Uri.parse('$baseUrl/getAllEvoSystems'),
      headers: {
        'Authorization': authToken,
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      evoSystems.value = data.map((e) => EvoSystem.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch EvoSystems');
    }
    isLoading.value = false;
  }

  // Fetch a single EvoSystem by ID
  Future<void> fetchEvoSystemById(int id) async {
    isLoading.value = true;
    final response = await http.get(
      Uri.parse('$baseUrl/getEvoSystemById/$id'),
      headers: {
        'Authorization': authToken,
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Handle the fetched EvoSystem data as needed
    } else {
      Get.snackbar('Error', 'Failed to fetch EvoSystem');
    }
    isLoading.value = false;
  }

  // Add a new EvoSystem
  Future<void> addEvoSystem(EvoSystem evoSystem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/addEvoSystem'),
      headers: {
        'Authorization': authToken,
        'Content-Type': 'application/json',
      },
      body: json.encode(evoSystem.toJson()),
    );
    if (response.statusCode == 201) {
      fetchAllEvoSystems();
      Get.snackbar('Success', 'EvoSystem added successfully');
    } else {
      Get.snackbar('Error', 'Failed to add EvoSystem');
    }
  }

  // Update an existing EvoSystem
  Future<void> updateEvoSystem(int id, EvoSystem evoSystem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/updateEvoSystem/$id'),
      headers: {
        'Authorization': authToken,
        'Content-Type': 'application/json',
      },
      body: json.encode(evoSystem.toJson()),
    );
    if (response.statusCode == 200) {
      fetchAllEvoSystems();
      Get.snackbar('Success', 'EvoSystem updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update EvoSystem');
    }
  }

  // Delete an EvoSystem
  Future<void> deleteEvoSystem(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/deleteEvoSystem/$id'),
      headers: {
        'Authorization': authToken,
      },
    );
    if (response.statusCode == 200) {
      fetchAllEvoSystems();
      Get.snackbar('Success', 'EvoSystem deleted successfully');
    } else {
      Get.snackbar('Error', 'Failed to delete EvoSystem');
    }
  }
}
