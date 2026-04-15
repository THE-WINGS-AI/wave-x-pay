import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';

class SetTouchidController extends GetxController {
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
      Get.toNamed('/set-faceid');
    } else {
      Get.snackbar("Failed", "Fingerprint not recognized. Please try again.");
    }
  }

  void skipForNow() {
    Get.toNamed('/set-faceid');
  }
}
