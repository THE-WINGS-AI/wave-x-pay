import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateMpinController extends GetxController {
final List<FocusNode> enterNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> enterControllers = List.generate(4, (index) => TextEditingController());

  // Focus nodes and controllers for "Confirm mPIN"
  final List<FocusNode> confirmNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> confirmControllers = List.generate(4, (index) => TextEditingController());

  void onPinChanged(String value, int index, bool isConfirm) {
    List<FocusNode> currentNodes = isConfirm ? confirmNodes : enterNodes;
    
    if (value.length == 1 && index < 3) {
      currentNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      currentNodes[index - 1].requestFocus();
    } else if (value.length == 1 && index == 3 && !isConfirm) {
      // Auto focus to first box of confirm pin after finishing enter pin
      confirmNodes[0].requestFocus();
    }
  }

  void setMpin() {
    String pin = enterControllers.map((e) => e.text).join();
    String confirmPin = confirmControllers.map((e) => e.text).join();

    if (pin.length == 4 && pin == confirmPin) {
      Get.toNamed('/set-touchid');
    } else {
      Get.snackbar("Error", "mPINs do not match", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
