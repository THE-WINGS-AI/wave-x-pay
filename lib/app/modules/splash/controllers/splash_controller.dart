import 'package:get/get.dart';
import 'package:xtpay/app/routes/app_pages.dart';
import 'package:xtpay/app/utils/storage.dart';

class SplashController extends GetxController {
  final AppStorage _storage = AppStorage();

   Future<bool> startTimer() async {
    await Future.delayed(const Duration(seconds: 10));

    String? token = await _storage.getToken();
 
    if (token != null && token != "null" && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
