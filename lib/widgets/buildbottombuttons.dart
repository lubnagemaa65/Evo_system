import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:factory_task/onBoarding/onBoardingController.dart';

class BuildBottomButtons extends StatelessWidget {
  const BuildBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (controller.currentPage.value == 0) {
        return Center(
          child: ElevatedButton(
            onPressed: controller.nextPage,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.25, // 25% of screen width
                vertical: 20,
              ),
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(),
            ),
            child: const Text("LET'S START",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1), // Adjust side padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // Blue border color
                    width: 2,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.jumpToPage(controller.onboardingData.length - 1);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.15, // 15% of screen width
                      vertical: 20,
                    ),
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "SKIP",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05), // Responsive spacing
              ElevatedButton(
                onPressed: () {
                  if (controller.currentPage.value ==
                      controller.onboardingData.length - 1) {
                    Navigator.pushNamed(context, '/settings');
                  } else {
                    controller.nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15, // 15% of screen width
                    vertical: 20,
                  ),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.blue,
                ),
                child: const Text("NEXT",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        );
      }
    });
  }
}
