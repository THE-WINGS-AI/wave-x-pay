import 'package:get/get.dart';

import '../controllers/networkerror_controller.dart';

class NetworkerrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkerrorController>(
      () => NetworkerrorController(),
    );
  }
}
