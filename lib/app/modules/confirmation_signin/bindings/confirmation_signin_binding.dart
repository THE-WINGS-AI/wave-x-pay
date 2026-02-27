import 'package:get/get.dart';

import '../controllers/confirmation_signin_controller.dart';

class ConfirmationSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationSigninController>(
      () => ConfirmationSigninController(),
    );
  }
}
