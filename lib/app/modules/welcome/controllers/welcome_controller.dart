import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void navigateToSignUp() {
    Get.toNamed('/signup'); 
  }

  /// Navigates to the Sign In screen
  void navigateToSignIn() {
    Get.toNamed('/signin');
  }
}
