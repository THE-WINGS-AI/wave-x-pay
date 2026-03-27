import 'package:get/get.dart';

import '../controllers/existing_login_controller.dart';

class ExistingLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExistingLoginController>(
      () => ExistingLoginController(),
    );
  }
}
