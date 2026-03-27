import 'package:get/get.dart';

class UserprofileController extends GetxController {
  var isDarkMode = false.obs;

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
  }

  void navigateToEditUserProfile() {
    Get.toNamed('/edit-user-profile');
  }
}
