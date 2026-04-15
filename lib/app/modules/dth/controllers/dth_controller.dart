import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DthController extends GetxController {
var selectedServiceIndex = 0.obs;

  var selectedProvider = "".obs;
  final idController = TextEditingController();

  final List<String> dthProviders = ["Tata Play", "Airtel Digital TV", "Dish TV"];
  final List<String> cableProviders = ["Hathway", "GTPL", "Siti Cable"];

  void toggleService(int index) {
    selectedServiceIndex.value = index;
    selectedProvider.value = ""; // Reset on toggle
    idController.clear();
  }

  void processRequest() {
    if (selectedServiceIndex.value == 0) {
      // print("Viewing plans for DTH...");
    } else {
      // print("Fetching bill details for Cable...");
    }
  }
}
