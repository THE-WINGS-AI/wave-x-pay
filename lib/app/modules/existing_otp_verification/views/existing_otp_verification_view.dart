import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/existing_otp_verification_controller.dart';

class ExistingOtpVerificationView
    extends GetView<ExistingOtpVerificationController> {

      final ExistingOtpVerificationController existingOtpVerificationController = Get.put(ExistingOtpVerificationController());
   ExistingOtpVerificationView({super.key});
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
        title: const Text("Log In", 
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                      const SizedBox(height: 60),

            // Main Box Container with requested decoration
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // Border: 2px solid #FF5D0021
                border: Border.all(
                  color: const Color(0x21FF5D00), 
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    // hex #FF5D0040 translates to Color(0x40FF5D00)
                    color: const Color(0x40FF5D00),
                    offset: const Offset(0, 3), 
                    blurRadius: 25,             
                    spreadRadius: 5,            
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Verify your mobile number",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "This verifies your identity and helps you securely log in to WaveXpay",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Enter the 4 digit Code",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
      
                  // OTP Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) => _buildOtpBox(index)),
                  ),
      
                  const SizedBox(height: 35),
      OrangeButton(label:   "Proceed", onTap: ()=>existingOtpVerificationController.proceedToHome()),
      
                   SizedBox(height: 20),
      
                  // Forgot Passcode Link
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Passcode? Try another way",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Styled individual OTP box
  Widget _buildOtpBox(int index) {
    return Container(
    alignment: Alignment.center,
      width: 55,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: existingOtpVerificationController.controllers[index],
        focusNode: existingOtpVerificationController.focusNodes[index],
        onChanged: (v) => existingOtpVerificationController.onOtpChanged(v, index),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}