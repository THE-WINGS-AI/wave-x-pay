import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReachargeController extends GetxController {
final mobileNumberController = TextEditingController();

  void browsePlans() {
    print("Navigating to plans for: ${mobileNumberController.text}");
    // Get.toNamed(Routes.RECHARGE_PLANS);
  }

  void openContactPicker() {
    print("Opening contacts...");
  }
}
