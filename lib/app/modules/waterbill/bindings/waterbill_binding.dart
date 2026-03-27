import 'package:get/get.dart';

import '../controllers/waterbill_controller.dart';

class WaterbillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterbillController>(
      () => WaterbillController(),
    );
  }
}
