// feedback_model.dart
class FeedbackModel {
  final int id;
  final String feedback;

  FeedbackModel({required this.id, required this.feedback});

  // Factory method to create a FeedbackModel from JSON
  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      feedback: json['feedback'],
    );
  }

  // Method to convert FeedbackModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feedback': feedback,
    };
  }
}
