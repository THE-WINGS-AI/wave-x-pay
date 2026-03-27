import 'package:get/get.dart';

import '../controllers/datacable_controller.dart';

class DatacableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatacableController>(
      () => DatacableController(),
    );
  }
}
