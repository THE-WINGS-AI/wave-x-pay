import 'package:get/get.dart';

import '../controllers/mpin_enter_controller.dart';

class MpinEnterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MpinEnterController>(
      () => MpinEnterController(),
    );
  }
}
