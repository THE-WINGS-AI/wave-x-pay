import 'package:get/get.dart';

import '../controllers/enter_amount_controller.dart';

class EnterAmountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterAmountController>(
      () => EnterAmountController(),
    );
  }
}
