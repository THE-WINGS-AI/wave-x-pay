import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/fingerprint_dialog.dart';

class SetTouchidController extends GetxController {
  var attempts = 0.obs;

  // Function to simulate or call biometric auth
  void handleAuthResult() {
    bool isSuccess = true;
    if (!isSuccess) attempts.value++;

    // Calling it exactly as you requested
    Get.bottomSheet(
      FingerprintDialog(
        isSuccess: isSuccess,
        currentAttempts: attempts.value,
      ),
      isDismissible: !isSuccess,
      enableDrag: false,
    );

    // Auto-handle the 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      if (isSuccess) {
        Get.toNamed('/set-faceid');
      } else {
        Get.back(); // Close bottom sheet on error
      }
    });
  }

  void skipForNow() {
    print("Skip for now pressed");
    // Navigate to Home/Dashboard
    Get.toNamed('/set-faceid');
  }
}
