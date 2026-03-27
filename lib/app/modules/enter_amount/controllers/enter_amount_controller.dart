import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class EnterAmountController extends GetxController {
// var currentStep = 1.obs;
  
//   // Amount Logic
//   final TextEditingController amountController = TextEditingController();
//   var displayAmount = "0".obs;

//   // mPIN Logic (4 separate controllers and focus nodes)
//   final List<TextEditingController> pinControllers = List.generate(4, (_) => TextEditingController());
//   final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

//   @override
//   void onInit() {
//     super.onInit();
//     amountController.addListener(() {
//       displayAmount.value = amountController.text.isEmpty ? "0" : amountController.text;
//     });
//   }

//   void onPinChanged(String value, int index) {
//     if (value.length == 1 && index < 3) {
//       focusNodes[index + 1].requestFocus();
//     } else if (value.isEmpty && index > 0) {
//       focusNodes[index - 1].requestFocus();
//     }
//   }

//   void onPayNow() {
//     if (currentStep.value == 1) {
//       if (amountController.text.isNotEmpty) {
//         currentStep.value = 2;
//       }
//     } else if (currentStep.value == 2) {
//       // Check if all 4 PIN boxes are filled
//       if (pinControllers.every((c) => c.text.isNotEmpty)) {
//         currentStep.value = 3;
//       }
//     }
//   }

//   void back() {
//     if (currentStep.value > 1) {
//       currentStep.value--;
//     } else {
//       Get.back();
//     }
//   }

//   @override
//   void onClose() {
//     amountController.dispose();
//     for (var c in pinControllers) {
//       c.dispose();
//     }
//     for (var f in focusNodes) {
//       f.dispose();
//     }
//     super.onClose();
//   }
// }

class EnterAmountController extends GetxController {
  var currentStep = 1.obs;
  
  // Amount & Note Logic
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController(); // Added Note
  var displayAmount = "0".obs;

  final List<TextEditingController> pinControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    amountController.addListener(() {
      displayAmount.value = amountController.text.isEmpty ? "0" : amountController.text;
    });
  }

  void onPinChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
  }

  void onPayNow() {
    if (currentStep.value == 1) {
      if (amountController.text.isNotEmpty) {
        currentStep.value = 2;
      }
    } else if (currentStep.value == 2) {
      // Simulate payment processing
      currentStep.value = 3;
      // Auto-navigate after success (Optional delay)
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed('/payment-details'); 
      });
    }
  }

  void back() {
    if (currentStep.value > 1) {
      currentStep.value = 1;
    } else {
      Get.back();
    }
  }

  @override
  void onClose() {
    amountController.dispose();
    noteController.dispose();
    for (var c in pinControllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.onClose();
  }
}