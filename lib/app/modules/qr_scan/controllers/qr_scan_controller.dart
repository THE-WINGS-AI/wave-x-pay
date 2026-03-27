import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QrScanController extends GetxController {
  CameraController? cameraController;
  var isInitialized = false.obs;
  var isSearching = false.obs; // Toggles between camera and list view
  var searchText = "".obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras[0], ResolutionPreset.high);
      await cameraController!.initialize();
      isInitialized.value = true;
    }
  }

  void toggleView() {
    isSearching.value = !isSearching.value;
  }

  // @override
  // void onClose() {
  //   cameraController?.dispose();
  //   super.onClose();
  // }

  void navigateToEnterAmount() {
    Get.toNamed('/enter-amount');
  }
}
