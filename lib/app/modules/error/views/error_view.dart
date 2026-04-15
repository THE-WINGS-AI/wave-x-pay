import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/error_controller.dart';

class ErrorView extends GetView<ErrorController> {
  final ErrorController errorController = Get.put(ErrorController());
  ErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Top Orange Wavy Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'asserts/images/top error image.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),

          // 2. Main Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100), // Push below the wavy header

                    // 404 Illustration
                    Image.asset(
                      'asserts/images/404 error image.png',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),

                    const SizedBox(height: 40),

                    // Error Message Title
                    const Text(
                      "OOPS... Page not found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Error Description
                    const Text(
                      "The page you are looking for doesn’t exist or any other error occurred, go back to home page.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 60),
                    OrangeButton(
                      label: "Go Back",
                      onTap: () => errorController.goHome(),
                      horizontalPadding: 5,
                    )
                    // Go Back Button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
