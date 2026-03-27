import 'package:get/get.dart';

import '../controllers/signin_otp_verification_controller.dart';

class SigninOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninOtpVerificationController>(
      () => SigninOtpVerificationController(),
    );
  }
}
