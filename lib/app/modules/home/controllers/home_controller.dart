import 'package:get/get.dart';

class HomeController extends GetxController {
var isBalanceVisible = true.obs;
  var currentTabIndex = 0.obs;

  void toggleBalance() => isBalanceVisible.value = !isBalanceVisible.value;
}
