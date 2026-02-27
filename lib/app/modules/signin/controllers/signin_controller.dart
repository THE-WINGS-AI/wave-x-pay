import 'package:get/get.dart';

class SigninController extends GetxController {
var phoneNumber = "".obs;

  void getOtp() {
    print("Getting OTP for: ${phoneNumber.value}");
    Get.toNamed('/login_otp_verification');
  }
   void navigateToSignUp() {
    Get.toNamed('/signup'); 
  }
}
