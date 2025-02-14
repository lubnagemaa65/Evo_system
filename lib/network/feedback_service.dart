// feedback_service.dart
import 'dart:convert';
import 'package:factory_task/models/feedback/feedback_model.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  static const String baseUrl = 'http://192.168.1.4:8000/api';

  static Future<List<FeedbackModel>?> getAllUserFeedbacks() async {
    final response = await http.get(
      Uri.parse('$baseUrl/getAllUserFeedBacks'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN_HERE',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((feedback) => FeedbackModel.fromJson(feedback))
          .toList();
    } else {
      // Handle error
      return null;
    }
  }

  static Future<FeedbackModel?> sendFeedback(String feedbackContent) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sendFeedback'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN_HERE',
        'Content-Type': 'application/json',
      },
      body: json.encode({'feedback': feedbackContent}),
    );

    if (response.statusCode == 201) {
      return FeedbackModel.fromJson(json.decode(response.body));
    } else {
      // Handle error
      return null;
    }
  }

  static Future<bool> deleteFeedback(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/deleteFeedback/$id'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN_HERE',
      },
    );

    return response.statusCode == 200;
  }
}
