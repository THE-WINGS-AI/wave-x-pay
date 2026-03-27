import 'package:get/get.dart';

class SigninController extends GetxController {
var phoneNumber = "".obs;

  void updatePhone(String fullNumber) {
    phoneNumber.value = fullNumber;
  }
  void getOtp() {
    print("Getting OTP for: ${phoneNumber.value}");
    Get.toNamed('/signin-otp-verification');
  }
   void navigateToSignUp() {
    Get.toNamed('/signup'); 
  }
}
