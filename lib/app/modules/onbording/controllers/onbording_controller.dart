import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  var currentIndex = 0.obs;
  final pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Zero Transaction Fee",
      "desc": "Make unlimited transactions without paying any service charges",
      "image": "asserts/images/onbording hero image 1.png"
    },
    {
      "title": "Zero Transaction Fee",
      "desc": "Make unlimited transactions without paying any service charges",
      "image": "asserts/images/onbording hero image 2.png"
    },
    {
      "title": "Zero Transaction Fee",
      "desc": "Make unlimited transactions without paying any service charges",
      "image": "asserts/images/onbording hero image 3.png"
    },
  ];

  bool get isLastPage => currentIndex.value == onboardingData.length - 1;

  void next() {
    if (isLastPage) {
     Get.toNamed('/welcome');
    } else {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.easeInOut);
    }
  }

  void previous() {
    pageController.previousPage(
        duration: 300.milliseconds, curve: Curves.easeInOut);
  }

  void skip() =>  Get.toNamed('/welcome');
}