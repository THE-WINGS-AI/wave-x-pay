import 'package:get/get.dart';
import 'package:xtpay/app/modules/history/controllers/history_controller.dart';
import 'package:xtpay/app/modules/history/views/history_view.dart';
import 'package:xtpay/app/modules/home/controllers/home_controller.dart';
import 'package:xtpay/app/modules/home/views/home_view.dart';
import 'package:xtpay/app/modules/qr_scan/controllers/qr_scan_controller.dart';
import 'package:xtpay/app/modules/qr_scan/views/qr_scan_view.dart';
import 'package:xtpay/app/modules/save/controllers/save_controller.dart';
import 'package:xtpay/app/modules/save/views/save_view.dart';
import 'package:xtpay/app/modules/utilities/controllers/utilities_controller.dart';
import 'package:xtpay/app/modules/utilities/views/utilities_view.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void updateIndex(int index) {
    if (index == 1) {
      Get.toNamed('/history');
    } else if (index == 2) {
      Get.toNamed('/qr-scan');
    } else {
      selectedIndex.value = index;
    }
  }

  var appPages = [HomeView(), HistoryView(), QrScanView(), UtilitiesView(), SaveView()];

  @override
  void onInit() {
    Get.put(HistoryController());
    Get.put(QrScanController());
    Get.put(HomeController());
    Get.put(SaveController());
    Get.put(UtilitiesController());
    super.onInit();
  }
}
