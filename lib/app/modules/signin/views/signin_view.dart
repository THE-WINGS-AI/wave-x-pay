import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold),
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
              ) ,
            ),
            const SizedBox(height: 10),

            // Phone Number Input Row
      Padding(
  padding:  EdgeInsets.symmetric(horizontal: 25),
  child: IntlPhoneField(
    // Logic integration with GetX
    onChanged: (phone) {
      signinController.updatePhone(phone.completeNumber);
    },
    initialCountryCode: 'IN',
    // UI Customization to match your design
    showDropdownIcon: true,
    dropdownIconPosition: IconPosition.trailing,
    flagsButtonPadding: const EdgeInsets.only(left: 8),
    decoration: InputDecoration(
      hintText: "Mobile Number",
      hintStyle: const TextStyle(color: Colors.grey),
      // Matching your specific border color 0xFFFFD6BE
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFFFD6BE), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      // Matching your specific focus color 0xFFFF5D00
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFFF5D00), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      // Important: ensures the border surrounds the whole field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
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
