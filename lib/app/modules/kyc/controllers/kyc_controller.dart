import 'package:get/get.dart';
import 'package:xtpay/app/modules/kyc/views/kyc_view.dart';

class KycController extends GetxController {
 void showKycPopup() {
    Get.dialog(
       KycView(),
      barrierDismissible: false, // user must choose action
    );
  }

  void closePopup() {
    Get.back();
  }

  void onMaybeLater() {
    Get.back();
  }

  void onCompleteKyc() {
    Get.back();
    Get.toNamed('/kyc');
  }
}
