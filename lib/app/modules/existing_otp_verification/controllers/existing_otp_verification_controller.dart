import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExistingOtpVerificationController extends GetxController {
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void proceedToHome() {
    // Logic for verification success
    Get.offAllNamed('/main-navigation'); // Navigates to HOME and clears stack
  }

  @override
  void onClose() {
    for (var node in focusNodes) node.dispose();
    for (var controller in controllers) controller.dispose();
    super.onClose();
  }
}
