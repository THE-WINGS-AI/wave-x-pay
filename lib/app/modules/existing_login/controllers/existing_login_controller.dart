import 'package:get/get.dart';

class ExistingLoginController extends GetxController {
  final String userName = "Anuj";
  final String maskedPhone = "+91 86______9109";

  void onContinue() {
    Get.toNamed('/existing-otp-verification');
  }

  void loginWithAnotherAccount() {
    Get.back();
  }
 }
