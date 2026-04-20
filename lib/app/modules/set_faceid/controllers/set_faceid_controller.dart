import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

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
    } 

    if (canUseFace) {
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
    } else {
      // Fallback to ML Kit face detection
      await _mlKitFaceDetection();
    }
  }

  Future<void> _mlKitFaceDetection() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) {
      Get.snackbar("Cancelled", "No image selected.");
      return;
    }

    final inputImage = InputImage.fromFilePath(pickedFile.path);
    final options = FaceDetectorOptions(
      enableContours: false,
      enableLandmarks: false,
    );
    final faceDetector = FaceDetector(options: options);

    final faces = await faceDetector.processImage(inputImage);

    if (faces.isNotEmpty) {
      Get.snackbar("Success", "Face detected! (ML Kit fallback)");
      Get.toNamed('/confirmation-signup');
    } else {
      Get.snackbar("Failed", "No face detected. Please try again.");
    }
    await faceDetector.close();
  }

  void skipForNow() {
    Get.toNamed('/confirmation-signup');
  }
}
