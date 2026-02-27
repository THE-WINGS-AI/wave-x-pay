import 'package:get/get.dart';
import 'package:xtpay/app/widgets/face_dialog.dart';

class SetFaceidController extends GetxController {
    var attempts = 0.obs;

  // Function to simulate or call biometric auth
  void handleAuthResult() {
    bool isSuccess = true;
    if (!isSuccess) attempts.value++;

    Get.bottomSheet(
      FaceDialog(
        isSuccess: isSuccess,
        currentAttempts: attempts.value,
      ),
      isDismissible: !isSuccess,
      enableDrag: false,
    );

    // Auto-handle the 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      if (isSuccess) {
        Get.toNamed('/confirmation-signin');
      } else {
        Get.back(); // Close bottom sheet on error
      }
    });
  }

  void skipForNow() {
    print("Skip for now pressed");
    // Navigate to Home/Dashboard
    Get.toNamed('/confirmation-signin');
  }
}
