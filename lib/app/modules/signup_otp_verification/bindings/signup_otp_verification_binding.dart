import 'package:get/get.dart';

import '../controllers/signup_otp_verification_controller.dart';

class SignupOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupOtpVerificationController>(
      () => SignupOtpVerificationController(),
    );
  }
}
