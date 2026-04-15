import 'package:get/get.dart';

class SignupController extends GetxController {
  var isWhatsAppAuthorized = true.obs;



 var phoneNumber = "".obs;

  void updatePhone(String fullNumber) {
    phoneNumber.value = fullNumber;
  }

  void onContinue() {
        Get.toNamed('/signup-otp-verification');

  }

  

  void goToLogin() {
    Get.toNamed('/signin');
  }
}
