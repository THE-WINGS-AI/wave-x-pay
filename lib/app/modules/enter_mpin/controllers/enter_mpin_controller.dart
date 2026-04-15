import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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
  final LocalAuthentication auth = LocalAuthentication();
  Future<void> handleAuthResult() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();
    if (!canCheckBiometrics || !isDeviceSupported) {
      Get.snackbar("Biometric not available", "Your device does not support biometric authentication.");
      return;
    }
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      Get.snackbar("Error", "Failed to get biometrics: $e");
      return;
    }

    // Check for Face ID (iOS) or face authentication (Android)
    bool hasFinger = false;
    if (Platform.isIOS) {
      hasFinger = availableBiometrics.contains(BiometricType.fingerprint);
    } else if (Platform.isAndroid) {
      // On Android, can't distinguish face/fingerprint, so allow if any biometric is available
      hasFinger = availableBiometrics.contains(BiometricType.strong) || availableBiometrics.contains(BiometricType.weak);
    }
    if (!hasFinger) {
      Get.snackbar("Fingerprint not available", "Your device does not support Fingerprint authentication.");
      return;
    }

    bool isSuccess = false;
    try {
      isSuccess = await auth.authenticate(
        localizedReason: 'Authenticate to enable Touch ID',
        biometricOnly: true,
      );
    } catch (e) {
      isSuccess = false;
      Get.snackbar("Error", "Biometric authentication failed: $e");
      return;
    }

    if (isSuccess) {
      // Here, you would call your backend to mark biometrics enabled (DO NOT send fingerprint data)
      Get.snackbar("Success", "Touch ID enabled successfully!");
      // Navigate to next onboarding step
    Get.offAllNamed('/main-navigation');
    } else {
      Get.snackbar("Failed", "Fingerprint not recognized. Please try again.");
    }
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
