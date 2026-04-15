import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/networkerror_controller.dart';

class NetworkerrorView extends GetView<NetworkerrorController> {
  final NetworkerrorController networkerrorController = Get.put(NetworkerrorController());
  NetworkerrorView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7), // Requested background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. No Internet Illustration
              Image.asset(
                'asserts/images/no internet connection.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const SizedBox(height: 50),

              // 2. Error Title
              const Text(
                "No Internet Connection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF323232),
                ),
              ),
              const SizedBox(height: 15),

              // 3. Error Description
              const Text(
                "Your internet connection is currently not available please check or try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4F4F4F),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),

              // 4. Try Again Button
              _buildRetryButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRetryButton() {
    return GestureDetector(
      onTap: networkerrorController.retryConnection,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // Signature Orange Gradient (FF5D00 100% to 52%)
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF5D00),
              Color(0x85FF5D00),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF060C8D).withOpacity(0.24),
              offset: const Offset(0, 20),
              blurRadius: 40,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Try Again",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}