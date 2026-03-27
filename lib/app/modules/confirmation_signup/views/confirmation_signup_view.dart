import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/confirmation_signup_controller.dart';

class ConfirmationSignupView extends GetView<ConfirmationSignupController> {
    final ConfirmationSignupController confirmationSignupController = Get.put(ConfirmationSignupController());
   ConfirmationSignupView({super.key});
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
          "Confirmation",
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
                'asserts/images/confirmation page hero image.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const SizedBox(height: 50),

              // Heading
              const Text(
                "You’re all Set.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Sub-heading
              const Text(
                "Please procedd to login and\nexperience your “waveXpay” app.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F), height: 1.5),
              ),
              SizedBox(height: 60),

              OrangeButton(label: "All right", horizontalPadding: 5, onTap: () => confirmationSignupController.navigateToNext()),
             
            ],
          ),
        ),
      ),
    );
  }
}
