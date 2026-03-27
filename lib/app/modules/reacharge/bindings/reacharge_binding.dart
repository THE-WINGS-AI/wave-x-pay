import 'package:get/get.dart';

import '../controllers/reacharge_controller.dart';

class ReachargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReachargeController>(
      () => ReachargeController(),
    );
  }
}
