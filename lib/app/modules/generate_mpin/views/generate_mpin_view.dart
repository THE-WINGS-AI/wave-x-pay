import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/generate_mpin_controller.dart';

class GenerateMpinView extends GetView<GenerateMpinController> {

  final GenerateMpinController generateMpinController = Get.put(GenerateMpinController());
  GenerateMpinView({super.key});
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
        title: const Text("Create mPIN", 
          style: TextStyle(color: Color(0xFF1D232E), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Center(
              child: Image.asset(
                'asserts/images/mpin hero image.png',
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            const SizedBox(height: 30),

            const Text("Enter mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _buildPinBox(index, false)),
            ),

            const SizedBox(height: 30),

            const Text("Confirm mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _buildPinBox(index, true)),
            ),

            const SizedBox(height: 50),

            // Set mPIN Button (Orange Gradient)
            OrangeButton(label: "Set mPIN",horizontalPadding: 5, onTap: () =>  generateMpinController.setMpin()),
            // _buildSetMpinButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPinBox(int index, bool isConfirm) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          alignment: Alignment.center,
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: TextField(
            controller: isConfirm ? generateMpinController.confirmControllers[index] : generateMpinController.enterControllers[index],
            focusNode: isConfirm ? generateMpinController.confirmNodes[index] : generateMpinController.enterNodes[index],
            onChanged: (v) => generateMpinController.onPinChanged(v, index, isConfirm),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: true, // Hide mPIN digits
            maxLength: 1,
            decoration: const InputDecoration(counterText: "", border: InputBorder.none),
          ),
        ),
      ),
    );
  }

}