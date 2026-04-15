import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:ui';
import '../controllers/enter_mpin_controller.dart';

class EnterMpinView extends GetView<EnterMpinController> {

  final EnterMpinController enterMpinController = Get.put(EnterMpinController());

  EnterMpinView({super.key});
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
        title: const Text("Enter mPIN", 
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Main Hero Image
            Center(
              child: Image.asset(
                'asserts/images/enter mpin main hero image.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            const SizedBox(height: 30),
            
            const Text(
              "Hello, Anuj",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF323232)),
            ),
            const SizedBox(height: 30),

            // PIN Input Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildPinBox(index)),
            ),

            const SizedBox(height: 20),

            // Forgot PIN Link
            TextButton(
              onPressed: enterMpinController.forgotPin,
              child: const Text(
                "Forgot your Login PIN?",
                style: TextStyle(color: Color(0xFF060C8D),  fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 40),

            // Sign In using Touch ID Button
            GestureDetector(
              onTap: () => enterMpinController.handleAuthResult(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4FA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('asserts/images/fingerprint icon.png', width: 40),
                    const SizedBox(width: 15),
                    const Text(
                      "Sign In using Touch ID",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF323232)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Styled PIN input box with Glassmorphism
  Widget _buildPinBox(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          alignment: Alignment.center,
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: enterMpinController.controllers[index],
            focusNode: enterMpinController.focusNodes[index],
            onChanged: (v) => enterMpinController.onPinChanged(v, index),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 1,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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