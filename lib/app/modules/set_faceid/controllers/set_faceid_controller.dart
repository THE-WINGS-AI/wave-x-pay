import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SetFaceidController extends GetxController {
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

    bool canUseFace = false;
    if (Platform.isIOS) {
      canUseFace = availableBiometrics.contains(BiometricType.face);
    } else if (Platform.isAndroid) {
      // On Android, can't distinguish face/fingerprint, so allow if any biometric is available
      canUseFace = availableBiometrics.contains(BiometricType.strong) || availableBiometrics.contains(BiometricType.weak);
    }

    if (!canUseFace) {
      Get.snackbar("Face Authentication not available", "Your device does not support Face Authentication.");
      return;
    }

    bool isSuccess = false;
    try {
      isSuccess = await auth.authenticate(
        localizedReason: 'Authenticate to enable Face Authentication',
        biometricOnly: true,
      );
    } catch (e) {
      isSuccess = false;
      Get.snackbar("Error", "Biometric authentication failed: $e");
      return;
    }

    if (isSuccess) {
      Get.snackbar("Success", "Face Authentication enabled successfully!");
      Get.toNamed('/confirmation-signup');
    } else {
      Get.snackbar("Failed", "Face Authentication not recognized. Please try again.");
    }
  }

  void skipForNow() {
    Get.toNamed('/confirmation-signup');
  }
}
