import 'package:get/get.dart';

import '../controllers/seeall_home_service_controller.dart';

class SeeallHomeServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeallHomeServiceController>(
      () => SeeallHomeServiceController(),
    );
  }
}
