// lib/controllers/area_controller.dart

import 'package:factory_task/models/areaModel/area_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AreaController extends GetxController {
  var areas = <AreaModel>[].obs;
  var isLoading = true.obs;
  final String apiUrl = 'http://192.168.1.4:8000/api';

  @override
  void onInit() {
    super.onInit();
    fetchAllAreas();
  }

  Future<void> fetchAllAreas() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('$apiUrl/getAllAreas'),
        headers: {
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        areas.value = data.map((json) => AreaModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch areas');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> addArea(String name) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$apiUrl/addArea'),
        headers: {
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
          'Content-Type': 'application/json',
        },
        body: json.encode({'name': name}),
      );
      if (response.statusCode == 201) {
        fetchAllAreas();
        Get.snackbar('Success', 'Area added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add area');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateArea(String id, String name) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$apiUrl/updateArea/$id'),
        headers: {
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
          'Content-Type': 'application/json',
        },
        body: json.encode({'name': name}),
      );
      if (response.statusCode == 200) {
        fetchAllAreas();
        Get.snackbar('Success', 'Area updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update area');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteArea(String id) async {
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse('$apiUrl/deleteArea/$id'),
        headers: {
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
      );
      if (response.statusCode == 200) {
        fetchAllAreas();
        Get.snackbar('Success', 'Area deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete area');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
