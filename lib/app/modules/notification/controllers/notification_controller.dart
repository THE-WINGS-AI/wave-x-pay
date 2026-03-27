import 'package:get/get.dart';

class NotificationController extends GetxController {
  var selectedTab = "All".obs;

  final List<String> tabs = ["All", "Transactions", "Alerts", "Offers"];

  void changeTab(String tab) {
    if (tab == "Offers") {
      Get.toNamed('offers');
    } else {
      selectedTab.value = tab;
    }
  }
}
