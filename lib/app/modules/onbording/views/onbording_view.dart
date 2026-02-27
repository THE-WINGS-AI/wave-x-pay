import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/fontsize.dart';

import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  final OnbordingController onbordingController = OnbordingController();

  OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Bottom Blur Image (Background)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'asserts/images/onbording blur image.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Swipeable Pages
          PageView.builder(
            controller: onbordingController.pageController,
            onPageChanged: onbordingController.currentIndex,
            itemCount: onbordingController.onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   SizedBox(height: CustomHight.h55),
                  // Hero Image
                  Image.asset(
                    onbordingController.onboardingData[index]['image']!,
                    width: MediaQuery.of(context).size.width ,
                  ),
                  const SizedBox(height: 5),
                  // Hero Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      onbordingController.onboardingData[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32, // Requested size
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5D00), // Requested color
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      onbordingController.onboardingData[index]['desc']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14, // Requested size
                        color: Color(0xFF060C8D), // Requested color
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 3. Navigation Controls (Skip/Back, Dots, Next Button)
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side: Skip or Back
                Obx(() {
                  bool isFirst = onbordingController.currentIndex.value == 0;
                  bool isLast = onbordingController.isLastPage;

                  if (isLast) {
                    return TextButton(
                      onPressed: onbordingController.previous,
                      child: const Text("Back", style: TextStyle(color: Color(0xFF979797), fontSize: 16)),
                    );
                  }
                  return TextButton(
                    onPressed: onbordingController.skip,
                    child: const Text("Skip", style: TextStyle(color: Color(0xFF00068B), fontSize: 16)),
                  );
                }),

                // Center: Indicator Dots
                Row(
                  children: List.generate(
                    onbordingController.onboardingData.length,
                    (index) => Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: onbordingController.currentIndex.value == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: onbordingController.currentIndex.value == index ? const Color(0xFFFFFFFF) : const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                  ),
                ),

                // Right Side: Next (Circle) or Get Started (Capsule)
                Obx(() => InkWell(
                      onTap: onbordingController.next,
                      child: AnimatedContainer(
                        duration: 300.milliseconds,
                        padding: EdgeInsets.symmetric(
                          horizontal: onbordingController.isLastPage ? 20 : 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF060C8D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: onbordingController.isLastPage
                            ? const Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              )
                            : const Icon(Icons.chevron_right, color: Colors.white, size: 20),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
