import 'package:get/get.dart';

import '../controllers/gasbill_controller.dart';

class GasbillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GasbillController>(
      () => GasbillController(),
    );
  }
}
