import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';
import 'package:xtpay/app/widgets/white_button.dart';

import '../controllers/set_touchid_controller.dart';

class SetTouchidView extends GetView<SetTouchidController> {
  final SetTouchidController setTouchidController = Get.put(SetTouchidController());
  SetTouchidView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Set Touch ID",
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Hero Image
              Image.asset(
                'asserts/images/set touch id hero image.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const SizedBox(height: 50),

              // Heading
              const Text(
                "Sign in Instantly with Touch ID",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Sub-heading
              const Text(
                "Would you like to use Touch ID\nto sign in to “WaveXpay” app?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F), height: 1.5),
              ),
              SizedBox(height: 60),

              OrangeButton(label: "Yes, enable Touch ID", horizontalPadding: 5, onTap: () => setTouchidController.handleAuthResult()),
              SizedBox(height: 50),
              WhiteButton(label: "Not right now!", horizontalPadding: 5, onTap: () => setTouchidController.skipForNow())
              // Secondary Button (Not right now!)
            ],
          ),
        ),
      ),
    );
  }
}
