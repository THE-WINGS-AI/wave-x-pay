import 'package:get/get.dart';

class HomeController extends GetxController {
var isBalanceVisible = true.obs;
  var currentTabIndex = 0.obs;

  var isWalletExpanded = false.obs;

  void toggleBalance() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }
var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
  // NEW method to toggle expansion
  void toggleWalletExpansion() {
    isWalletExpanded.value = !isWalletExpanded.value;
  }
}
