import 'package:get/get.dart';

class SignupController extends GetxController {
  var isWhatsAppAuthorized = true.obs;

  var firstName = "".obs;
  var lastName = "".obs;
  var phone = "".obs;
  var dob = "".obs;

 

  void onContinue() {
        Get.toNamed('/signup-otp-verification');

  }

  

  void goToLogin() {
    Get.toNamed('/signin');
  }
}
