import 'package:get/get.dart';

import '../controllers/confirmation_signup_controller.dart';

class ConfirmationSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationSignupController>(
      () => ConfirmationSignupController(),
    );
  }
}
