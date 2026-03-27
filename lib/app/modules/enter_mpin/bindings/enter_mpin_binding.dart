import 'package:get/get.dart';

import '../controllers/enter_mpin_controller.dart';

class EnterMpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterMpinController>(
      () => EnterMpinController(),
    );
  }
}
