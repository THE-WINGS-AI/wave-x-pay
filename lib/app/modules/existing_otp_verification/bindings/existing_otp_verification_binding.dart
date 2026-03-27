import 'package:get/get.dart';

import '../controllers/existing_otp_verification_controller.dart';

class ExistingOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExistingOtpVerificationController>(
      () => ExistingOtpVerificationController(),
    );
  }
}
