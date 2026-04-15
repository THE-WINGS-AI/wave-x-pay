import 'package:get/get.dart';

import '../modules/bottomNavBar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottomNavBar/views/bottom_nav_bar_view.dart';
import '../modules/confirmation_signup/bindings/confirmation_signup_binding.dart';
import '../modules/confirmation_signup/views/confirmation_signup_view.dart';
import '../modules/datacable/bindings/datacable_binding.dart';
import '../modules/datacable/views/datacable_view.dart';
import '../modules/dth/bindings/dth_binding.dart';
import '../modules/dth/views/dth_view.dart';
import '../modules/edit_user_profile/bindings/edit_user_profile_binding.dart';
import '../modules/edit_user_profile/views/edit_user_profile_view.dart';
import '../modules/electricity/bindings/electricity_binding.dart';
import '../modules/electricity/views/electricity_view.dart';
import '../modules/enter_amount/bindings/enter_amount_binding.dart';
import '../modules/enter_amount/views/enter_amount_view.dart';
import '../modules/enter_mpin/bindings/enter_mpin_binding.dart';
import '../modules/enter_mpin/views/enter_mpin_view.dart';
import '../modules/error/bindings/error_binding.dart';
import '../modules/error/views/error_view.dart';
import '../modules/existing_login/bindings/existing_login_binding.dart';
import '../modules/existing_login/views/existing_login_view.dart';
import '../modules/existing_otp_verification/bindings/existing_otp_verification_binding.dart';
import '../modules/existing_otp_verification/views/existing_otp_verification_view.dart';
import '../modules/gasbill/bindings/gasbill_binding.dart';
import '../modules/gasbill/views/gasbill_view.dart';
import '../modules/generate_mpin/bindings/generate_mpin_binding.dart';
import '../modules/generate_mpin/views/generate_mpin_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/networkerror/bindings/networkerror_binding.dart';
import '../modules/networkerror/views/networkerror_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/offers/bindings/offers_binding.dart';
import '../modules/offers/views/offers_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/payment_details/bindings/payment_details_binding.dart';
import '../modules/payment_details/views/payment_details_view.dart';
import '../modules/qr_scan/bindings/qr_scan_binding.dart';
import '../modules/qr_scan/views/qr_scan_view.dart';
import '../modules/reacharge/bindings/reacharge_binding.dart';
import '../modules/reacharge/views/reacharge_view.dart';
import '../modules/save/bindings/save_binding.dart';
import '../modules/save/views/save_view.dart';
import '../modules/seeall_home_service/bindings/seeall_home_service_binding.dart';
import '../modules/seeall_home_service/views/seeall_home_service_view.dart';
import '../modules/set_faceid/bindings/set_faceid_binding.dart';
import '../modules/set_faceid/views/set_faceid_view.dart';
import '../modules/set_touchid/bindings/set_touchid_binding.dart';
import '../modules/set_touchid/views/set_touchid_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signin_otp_verification/bindings/signin_otp_verification_binding.dart';
import '../modules/signin_otp_verification/views/signin_otp_verification_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup_otp_verification/bindings/signup_otp_verification_binding.dart';
import '../modules/signup_otp_verification/views/signup_otp_verification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/userprofile/bindings/userprofile_binding.dart';
import '../modules/userprofile/views/userprofile_view.dart';
import '../modules/utilities/bindings/utilities_binding.dart';
import '../modules/utilities/views/utilities_view.dart';
import '../modules/waterbill/bindings/waterbill_binding.dart';
import '../modules/waterbill/views/waterbill_view.dart';
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
      page: () => UserprofileView(),
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
      page: () => ConfirmationSignupView(),
      binding: ConfirmationSignupBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_MPIN,
      page: () => EnterMpinView(),
      binding: EnterMpinBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN_OTP_VERIFICATION,
      page: () => SigninOtpVerificationView(),
      binding: SigninOtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.EXISTING_LOGIN,
      page: () => ExistingLoginView(),
      binding: ExistingLoginBinding(),
    ),
    GetPage(
      name: _Paths.EXISTING_OTP_VERIFICATION,
      page: () => ExistingOtpVerificationView(),
      binding: ExistingOtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCAN,
      page: () => QrScanView(),
      binding: QrScanBinding(),
    ),
    GetPage(
      name: _Paths.UTILITIES,
      page: () => UtilitiesView(),
      binding: UtilitiesBinding(),
    ),
    GetPage(
      name: _Paths.SAVE,
      page: () => SaveView(),
      binding: SaveBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USER_PROFILE,
      page: () => EditUserProfileView(),
      binding: EditUserProfileBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_AMOUNT,
      page: () => EnterAmountView(),
      binding: EnterAmountBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.REACHARGE,
      page: () => ReachargeView(),
      binding: ReachargeBinding(),
    ),
    GetPage(
      name: _Paths.ELECTRICITY,
      page: () => ElectricityView(),
      binding: ElectricityBinding(),
    ),
    GetPage(
      name: _Paths.GASBILL,
      page: () => GasbillView(),
      binding: GasbillBinding(),
    ),
    GetPage(
      name: _Paths.WATERBILL,
      page: () => WaterbillView(),
      binding: WaterbillBinding(),
    ),
    GetPage(
      name: _Paths.DTH,
      page: () => DthView(),
      binding: DthBinding(),
    ),
    GetPage(
      name: _Paths.SEEALL_HOME_SERVICE,
      page: () => SeeallHomeServiceView(),
      binding: SeeallHomeServiceBinding(),
    ),
    GetPage(
      name: _Paths.DATACABLE,
      page: () => DatacableView(),
      binding: DatacableBinding(),
    ),
    GetPage(
      name: _Paths.ERROR,
      page: () => ErrorView(),
      binding: ErrorBinding(),
    ),
    GetPage(
      name: _Paths.NETWORKERROR,
      page: () =>  NetworkerrorView(),
      binding: NetworkerrorBinding(),
    ),
  ];
}
