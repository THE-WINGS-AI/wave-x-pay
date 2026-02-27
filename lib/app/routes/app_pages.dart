import 'package:get/get.dart';

import '../modules/confirmation_signin/bindings/confirmation_signin_binding.dart';
import '../modules/confirmation_signin/views/confirmation_signin_view.dart';
import '../modules/generate_mpin/bindings/generate_mpin_binding.dart';
import '../modules/generate_mpin/views/generate_mpin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mpin_enter/bindings/mpin_enter_binding.dart';
import '../modules/mpin_enter/views/mpin_enter_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/set_faceid/bindings/set_faceid_binding.dart';
import '../modules/set_faceid/views/set_faceid_view.dart';
import '../modules/set_touchid/bindings/set_touchid_binding.dart';
import '../modules/set_touchid/views/set_touchid_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup_otp_verification/bindings/signup_otp_verification_binding.dart';
import '../modules/signup_otp_verification/views/signup_otp_verification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/userprofile/bindings/userprofile_binding.dart';
import '../modules/userprofile/views/userprofile_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBORDING,
      page: () => OnbordingView(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.USERPROFILE,
      page: () => const UserprofileView(),
      binding: UserprofileBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_OTP_VERIFICATION,
      page: () => SignupOtpVerificationView(),
      binding: SignupOtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE_MPIN,
      page: () => GenerateMpinView(),
      binding: GenerateMpinBinding(),
    ),
    GetPage(
      name: _Paths.SET_TOUCHID,
      page: () => SetTouchidView(),
      binding: SetTouchidBinding(),
    ),
    GetPage(
      name: _Paths.SET_FACEID,
      page: () => SetFaceidView(),
      binding: SetFaceidBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMATION_SIGNIN,
      page: () => ConfirmationSigninView(),
      binding: ConfirmationSigninBinding(),
    ),
    GetPage(
      name: _Paths.MPIN_ENTER,
      page: () =>  MpinEnterView(),
      binding: MpinEnterBinding(),
    ),
  ];
}
