import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/existing_login_controller.dart';

class ExistingLoginView extends GetView<ExistingLoginController> {
  final ExistingLoginController existingLoginController = Get.put(ExistingLoginController());
  ExistingLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // Light bluish background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Log In',
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Main Profile Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    // Added border: 2px solid #FF5D0021
    border: Border.all(
      color: const Color(0x21FF5D00), 
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        // hex #FF5D0040 translates to Color(0x40FF5D00)
        color: const Color(0x40FF5D00),
        offset: const Offset(0, 3), // 0px x, 3px y
        blurRadius: 25,             // 25px
        spreadRadius: 5,            // 5px
      ),
    ],
  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Image with Border
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD4814F), // Brownish border
                      shape: BoxShape.circle,
                    ),
                    child:  CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('asserts/images/user profile icon existing login.png'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    existingLoginController.userName,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    existingLoginController.maskedPhone,
                    style: const TextStyle(fontSize: 18, letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),

                  OrangeButton(label: "Continue as ${existingLoginController.userName}", onTap: () => existingLoginController.onContinue())
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Footer Links
          TextButton(
            onPressed: existingLoginController.loginWithAnotherAccount,
            child: const Text(
              "Login with another WaveXpay Account",
              style: TextStyle(
                color: Colors.black54,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          // Terms Checkbox
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: true,
                    onChanged: (val) {},
                    activeColor: const Color(0xFF5C6BC0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "By proceeding, you are agreeing to WaveXpay's ",
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                      children: [
                        TextSpan(
                          text: "Terms and Conditions & Privacy Policy.",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
