import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/signin_otp_verification_controller.dart';

class SigninOtpVerificationView
    extends GetView<SigninOtpVerificationController> {
  final SigninOtpVerificationController signinOtpVerificationController = Get.put(SigninOtpVerificationController());
   SigninOtpVerificationView({super.key});
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
        title: const Text("Verification", style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Hero Image
            Image.asset(
              'asserts/images/signup otp verification hero image.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const SizedBox(height: 30),
            const Text(
              "Enter the Verification Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              // "Enter the 4 digit Code that we sent\nto 8619___09",
                            "Enter the 4 digit Code that we sent",

              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // OTP Input Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildOtpBox(index)),
            ),

            const SizedBox(height: 40),
            OrangeButton(label: "Continue",horizontalPadding: 5, onTap: () => signinOtpVerificationController.verifyOtp()),
            // Continue Button (Orange Gradient)
            // _buildContinueButton(),

            const SizedBox(height: 40),

            // Resend Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive anything? ", style: TextStyle(color: Colors.grey)),
                TextButton.icon(
                  onPressed: signinOtpVerificationController.resendOtp,
                  icon: const Icon(Icons.refresh, size: 18, color: Color(0xFF060C8D)),
                  label: const Text("Resend", style: TextStyle(color: Color(0xFF060C8D), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // OTP Box with CSS Specs (Glassmorphism)
  Widget _buildOtpBox(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // blur(12px)
        child: Container(
          alignment: Alignment.center,
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15), // background: rgba(255, 255, 255, 0.15)
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.3)), // border rgba(255, 255, 255, 0.3)
            boxShadow: [
              // Outer Shadow
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 16,
              ),
              // Simulation of Inset Shadow via inner border/lighting
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(0, 1),
                spreadRadius: -1,
              ),
            ],
          ),
          child: TextField(
            controller: signinOtpVerificationController.controllers[index],
            focusNode: signinOtpVerificationController.focusNodes[index],
            onChanged: (v) => signinOtpVerificationController.onOtpChanged(v, index),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

}
