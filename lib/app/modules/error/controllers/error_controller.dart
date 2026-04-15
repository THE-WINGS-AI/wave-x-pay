import 'package:get/get.dart';

class ErrorController extends GetxController {
void goHome() {
    // Navigates the user back to the home screen
    Get.offAllNamed('/main-navigation');
  }
}
