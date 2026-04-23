import 'package:get/get.dart';
import 'package:xtpay/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:xtpay/app/modules/kyc/views/kyc_view.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
 Get.put(KycController());

  // Then use it
  Future.delayed(Duration.zero, () {
    Get.find<KycController>().showKycPopup();
  });
      super.onInit();
  }



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

  var showKycError = true.obs;

  void closeKyc() {
    showKycError.value = false;
  }

  void openKyc() {
    showKycError.value = true;
  }

  void onMaybeLater() {
    showKycError.value = false;
  }

  void onCompleteKyc() {
    // Navigate or trigger action
    // Get.toNamed('/kyc');
  }
}
