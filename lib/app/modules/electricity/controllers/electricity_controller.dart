import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ElectricityController extends GetxController {
// Observables for dropdown selections
  var selectedState = "Delhi NCR".obs;
  var selectedProvider = "BSES Rajdhani".obs;
  
  final consumerIdController = TextEditingController();

  final List<String> states = ["Delhi NCR", "Gujarat", "Maharashtra", "Karnataka"];
  final List<String> providers = ["BSES Rajdhani", "TPDDL", "Adani Electricity"];

  void fetchBill() {
    print("Fetching bill for: ${consumerIdController.text} from ${selectedProvider.value}");
  }
}
