import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/fontsize.dart';
import 'package:xtpay/app/widgets/orange_button.dart';
import 'package:xtpay/app/widgets/white_button.dart';
  import 'dart:ui';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final SignupController signupController = Get.put(SignupController());
  SignupView({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
        
              Get.back();
            
          },
        ),
        title: Text(
             "Sign up",
              style: const TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold),
            ),centerTitle: true,
     ),
      body:  SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:  _buildDetailsStep(),
          ),
    );
  }


  Widget _buildDetailsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel("First Name"),
        _buildGlassInputField(child: const TextField(decoration: InputDecoration(hintText: "", border: InputBorder.none))),
        _buildLabel("Last Name"),
        _buildGlassInputField(child: const TextField(decoration: InputDecoration(hintText: "", border: InputBorder.none))),
        _buildLabel("Phone Number"),
        _buildGlassInputField(child: const TextField(decoration: InputDecoration(hintText: "", border: InputBorder.none))),
        _buildLabel("D.O.B"),
        _buildGlassInputField(child: const TextField(decoration: InputDecoration(hintText: "", border: InputBorder.none))),
        const SizedBox(height: 60),
        OrangeButton(label: "Continue",horizontalPadding:5,onTap: () =>  signupController.onContinue()),
        const SizedBox(height: 60),
        _buildBottomLoginLink(),
      ],
    );
  }

  // UI COMPONENTS

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  // The specific Glassmorphism Field with Figma Shadows
  Widget _buildGlassInputField({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFFFD6BE), width: 1),
            boxShadow: const [
              BoxShadow(color: Color(0x1A000000), offset: Offset(3, 3), blurRadius: 10, spreadRadius: -3), // Inner Shadow simulation
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildOrangeButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF5D00), Color(0x85FF5D00)], // FF5D00 100% to 52%
          ),
          boxShadow: [
            BoxShadow(color: const Color(0xFF060C8D).withOpacity(0.24), offset: const Offset(0, 20), blurRadius: 40),
          ],
        ),
        child: Center(
          child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }


  Widget _buildBottomLoginLink() {
    return Column(
      children: [
        const Center(child: Text("Already have an account?")),
        const SizedBox(height: 10),
        WhiteButton(label: "Sign in", onTap: signupController.goToLogin,horizontalPadding: 0,),
       
      ],
    );
  }

}
