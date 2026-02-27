import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';
import 'package:xtpay/app/widgets/white_button.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  final SigninController signinController = Get.put(SigninController());
  SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Log In",
          style: TextStyle(color: Color(0xFF060C8D), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Hero Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset(
                'asserts/images/login hero image.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            const SizedBox(height: 40),

            // Phone Number Field Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Phone Number Input Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  // Country Code Picker (Stylized)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFFD6BE), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.network('https://flagcdn.com/w40/in.png', width: 24), // India Flag
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Mobile Number Field
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "+91 Mobile Number",
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFFFD6BE), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFFF5D00), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
            OrangeButton(
              label: "Get OTP",
              horizontalPadding: 30,
              onTap: () => signinController.getOtp(),
            ),

            SizedBox(height: 60),

            Text("Don't have an account?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 15),

            WhiteButton(
              label: "Sign Up",
                            horizontalPadding: 30,

              onTap: () => signinController.navigateToSignUp(),
            ),
          ],
        ),
      ),
    );
  }
}
