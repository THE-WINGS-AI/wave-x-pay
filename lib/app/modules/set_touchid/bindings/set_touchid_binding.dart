import 'package:get/get.dart';

import '../controllers/set_touchid_controller.dart';

class SetTouchidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetTouchidController>(
      () => SetTouchidController(),
    );
  }
}
