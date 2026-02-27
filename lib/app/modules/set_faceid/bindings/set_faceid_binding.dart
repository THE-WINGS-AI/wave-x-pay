import 'package:get/get.dart';

import '../controllers/set_faceid_controller.dart';

class SetFaceidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetFaceidController>(
      () => SetFaceidController(),
    );
  }
}
