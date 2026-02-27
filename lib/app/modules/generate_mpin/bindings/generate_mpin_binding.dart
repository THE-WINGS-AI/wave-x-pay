import 'package:get/get.dart';

import '../controllers/generate_mpin_controller.dart';

class GenerateMpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateMpinController>(
      () => GenerateMpinController(),
    );
  }
}
