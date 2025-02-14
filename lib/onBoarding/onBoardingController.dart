import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  var currentPage = 0.obs;

  // Sample onboarding data
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Discover",
      "description":
          "Excepteur sint occoecal cup.. non proident,\n sunt in culpo qui officio deserunt ",
      "image": "assets/images/onb1.PNG",
    },
    {
      "title": "Excepteur sint\n     occaecat",
      "description":
          "Ut labore et dolore roipi mana aliqua. Enim\n adeop minim veeniam nostruklad",
      "image": "assets/images/onb2.PNG",
    },
    {
      "title": "Excepteur sint\n     occaecat",
      "description":
          "Ut labore et dolore roipi mana aliqua. Enim\n adeop minim veeniam nostruklad",
      "image": "assets/images/onb2.PNG",
    },
  ];
  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Function to move to the previous page
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Jump to a specific page
  void jumpToPage(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }
}
