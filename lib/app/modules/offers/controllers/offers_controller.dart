import 'package:get/get.dart';

class OffersController extends GetxController {
var selectedCategory = "All".obs;

  final List<String> categories = ["All", "Cashback", "Recharge", "Shopping", "Travel"];

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}
