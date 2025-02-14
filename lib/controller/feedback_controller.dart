// feedback_controller.dart

import 'package:factory_task/models/feedback/feedback_model.dart';
import 'package:factory_task/network/feedback_service.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var feedbackList = <FeedbackModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllFeedbacks();
  }

  // Fetch all user feedbacks
  void fetchAllFeedbacks() async {
    isLoading.value = true;
    try {
      var feedbacks = await FeedbackService.getAllUserFeedbacks();
      if (feedbacks != null) {
        feedbackList.assignAll(feedbacks);
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Send new feedback
  void sendFeedback(String feedbackContent) async {
    isLoading.value = true;
    try {
      var feedback = await FeedbackService.sendFeedback(feedbackContent);
      if (feedback != null) {
        feedbackList.add(feedback);
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Delete feedback by ID
  void deleteFeedback(int id) async {
    isLoading.value = true;
    try {
      var success = await FeedbackService.deleteFeedback(id);
      if (success) {
        feedbackList.removeWhere((feedback) => feedback.id == id);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
