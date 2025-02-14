// controllers/join_request_controller.dart

import 'package:factory_task/models/join_RequestModel/joinRequestModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JoinRequestController extends GetxController {
  var joinRequests = <JoinRequestModel>[].obs;
  var isLoading = false.obs;

  final String baseUrl = 'http://192.168.1.4:8000/api/';

  Future<void> makeJoinRequest(JoinRequestModel request) async {
    isLoading.value = true;
    final url = Uri.parse('${baseUrl}makeJoinRequest');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
    };
    final body = json.encode(request.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Handle success
        getAllJoinRequests();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllJoinRequests() async {
    isLoading.value = true;
    final url = Uri.parse('${baseUrl}getAllJoinRequests');
    final headers = {
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        joinRequests.value = data
            .map((item) => JoinRequestModel(
                  name: item['name'],
                  phone: item['phone'],
                  email: item['email'],
                  numberOfFacilities: item['numberOfFacilities'],
                  facilities: (item['facilities'] as List)
                      .map((f) => Facility(
                            facilityName: f['facilityName'],
                            systemTypeIds: List<int>.from(f['systemTypeIds']),
                            areaId: f['areaId'],
                            locationUrl: f['locationUrl'],
                          ))
                      .toList(),
                ))
            .toList();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> approveJoinRequest(int id) async {
    isLoading.value = true;
    final url = Uri.parse('${baseUrl}approveJoinRequest/$id');
    final headers = {
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
    };

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        // Handle success
        getAllJoinRequests();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cancelJoinRequest(int id) async {
    isLoading.value = true;
    final url = Uri.parse('${baseUrl}cancelJoinRequest/$id');
    final headers = {
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
    };

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        // Handle success
        getAllJoinRequests();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    } finally {
      isLoading.value = false;
    }
  }
}
