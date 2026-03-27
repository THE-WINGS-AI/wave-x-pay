import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterbillController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;
  void fetchBill() {
    return;
  }

  var selectedProvider = "Select your water provider".obs;
  final List<String> providers = ["Select your water provider", "Delhi Jal Board", "BMC Water", "Gujarat Water Board"];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
