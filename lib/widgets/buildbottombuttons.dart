import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:factory_task/onBoarding/onBoardingController.dart';

class BuildBottomButtons extends StatelessWidget {
  const BuildBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    return Obx(() {
      if (controller.currentPage.value == 0) {
        return ElevatedButton(
          onPressed: controller.nextPage,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(), // Normal rectangle shape
          ),
          child: const Text("LET'S START",
              style: TextStyle(fontSize: 18, color: Colors.white)),
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Blue border color
                  width: 2, // Adjust border width
                ),
                borderRadius:
                    BorderRadius.all(Radius.zero), // Round the corners
              ),
              child: ElevatedButton(
                onPressed: () {
                  controller.jumpToPage(controller.onboardingData.length - 1);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "SKIP",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.currentPage.value ==
                    controller.onboardingData.length - 1) {
                  // If on the last page, navigate to the sec-fac page
                  Navigator.pushNamed(context, '/settings');
                } else {
                  controller.nextPage();
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.blue,
              ),
              child: const Text("NEXT",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        );
      }
    });
  }
}
