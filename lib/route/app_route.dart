import 'package:clam_ai/feature/auth/login_screen.dart';
import 'package:clam_ai/feature/auth/otp_screen.dart';
import 'package:clam_ai/feature/auth/signup_screen.dart';
import 'package:clam_ai/route/route_name.dart';
import 'package:get/get.dart';

import '../feature/auth/language_screen.dart';
import '../feature/auth/reset_password_screen.dart';
import '../feature/auth/update_password_screen.dart';
import '../feature/splash/splash_loading_screen.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.splashloading,
      page: () => LoadingSplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.language,
      page: () => LanguageScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),GetPage(
      name: RouteName.signup,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),GetPage(
      name: RouteName.resetpassword,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),GetPage(
      name: RouteName.otpScreen,
      page: () => OtpVerificationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),GetPage(
      name: RouteName.updatePassword,
      page: () => UpdatePasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
