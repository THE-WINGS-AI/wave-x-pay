import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditUserProfileController extends GetxController {
  final firstNameController = TextEditingController(text: "John");
  final phoneController = TextEditingController(text: "8619****09");
  final dobController = TextEditingController(text: "19/03/1999");

  void onUpdateProfile() {
    print("Profile Updated for: ${firstNameController.text}");
    Get.back(); // Return to previous screen after update
  }

  void onChangeProfileImage() {
    print("Change profile image triggered");
  }

  @override
  void onClose() {
    firstNameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.onClose();
  }
}
