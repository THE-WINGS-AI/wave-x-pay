import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void navigateToSignUp() {
    Get.toNamed('/signup'); 
  }

  void navigateToSignIn() {
    Get.toNamed('/signin');
  }
  // void navigateToSignIn() {
  //   Get.toNamed('/existing-login');
  // }
}
