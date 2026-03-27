import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GasbillController extends GetxController {
  var selectedProvider = "Choose your provider".obs;
  
  final consumerNumberController = TextEditingController();

  final List<String> providers = [
    "Choose your provider",
    "Indane Gas",
    "HP Gas",
    "Bharat Gas"
  ];

  void fetchBill() {
    if (selectedProvider.value != "Choose your provider") {
      print("Fetching Gas Bill for: ${consumerNumberController.text}");
    } else {
      Get.snackbar("Error", "Please select a provider");
    }
  }
}
