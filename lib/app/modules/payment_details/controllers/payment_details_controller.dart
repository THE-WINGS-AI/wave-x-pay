import 'package:get/get.dart';

class PaymentDetailsController extends GetxController {
  void shareReceipt() {
    print("Sharing receipt...");
  }

  void goHome() {
    Get.offAllNamed('/main-navigation');
  }

  void payAgain() {
    Get.back(); // Or navigate to Enter Amount screen
  }
}