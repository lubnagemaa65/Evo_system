import 'package:factory_task/controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  FeedbackController feedbackController = Get.put(FeedbackController());
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Bar Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                const Text(
                  'LOGO',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Icon(Icons.notifications, color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Light Blue Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // About Us Section
                const Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Contact Information Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildInfoRow(Icons.phone, "+971 55****"),
                        const SizedBox(height: 12),
                        _buildInfoRow(Icons.location_on, "www.example.com"),
                        const SizedBox(height: 12),
                        _buildInfoRow(FontAwesomeIcons.whatsapp, "+971 55***"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Feedback Section (Outside the Card)
                const Text(
                  "Feed back",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),

                // Feedback Card (Without Button Inside)
                Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: 200,
                    )),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 150),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        feedbackController.sendFeedback("feedbackContent");
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),

                // Send Button (Moved Outside the Card, at Bottom)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for contact rows (Phone, Location, WhatsApp)
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
