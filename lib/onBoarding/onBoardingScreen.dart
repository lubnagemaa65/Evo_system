import 'package:factory_task/widgets/build_dots.dart';
import 'package:factory_task/widgets/buildbottombuttons.dart';
import 'package:flutter/material.dart';
import 'package:factory_task/onBoarding/onBoardingController.dart';
import 'package:factory_task/widgets/onBoardingContent.dart';
import 'package:get/get.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final OnboardingController controller = Get.put(OnboardingController());
  int currentPage = 0; // Use normal int instead of RxInt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: currentPage == 0
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.blue, size: 30),
                onPressed: () {
                  setState(() {
                    if (currentPage > 0) {
                      currentPage--;
                      controller.pageController.jumpToPage(currentPage);
                    }
                  });
                },
              ),
            ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: constraints.maxHeight * 0.45,
              child: Container(
                color: currentPage == 0
                    ? const Color.fromRGBO(241, 248, 255, 1)
                    : Colors.white,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final data = controller.onboardingData[index];
                      return OnboardingContent(
                        title: data["title"]!,
                        description: data["description"]!,
                        image: data["image"]!,
                        isFirstPage: index == 0,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onboardingData.length,
                    (index) => BuildDot(index: index, currentPage: currentPage),
                  ),
                ),
                const SizedBox(height: 100),
                BuildBottomButtons(),
                const SizedBox(height: 20),
              ],
            ),
          ],
        );
      }),
    );
  }
}
