import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EnterMpinController extends GetxController {
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  void onPinChanged(String value, int index) {
    
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    if (index == 3 && value.isNotEmpty) {
      validateMpin();
    }
  }
void validateMpin() {
    String pin = controllers.map((e) => e.text).join();
    
    if (pin == "0000") {
      // Navigates and removes all previous screens from the stack
      Get.offAllNamed('/main-navigation');
    } else {
      // Optional: Clear fields or show error if PIN is wrong
      Get.snackbar("Error", "Invalid mPIN\nCorrect mPIN = 0000", snackPosition: SnackPosition.BOTTOM);
      for (var controller in controllers) {
        controller.clear();
      }
      focusNodes[0].requestFocus();
    }
  }

  void forgotPin() {
    // "do nothing" as requested
    print("Forgot PIN tapped - No action defined.");
  }

  void authenticateWithBiometrics() {
    print("Opening biometric scanner...");
    // Direct navigation as requested
    Get.offAllNamed('/main-navigation');
  }

  @override
  void onClose() {
    // Good practice: Dispose nodes and controllers
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
  void login() {
    String pin = controllers.map((e) => e.text).join();
    print("Logging in with PIN: $pin");
    Get.offAllNamed('/main-navigation');
    // Implement auth logic
  }


}
