import 'package:clam_ai/feature/auth/screen/login_screen.dart';
import 'package:clam_ai/feature/auth/screen/otp_screen.dart';
import 'package:clam_ai/feature/auth/screen/question1_screen.dart';
import 'package:clam_ai/feature/auth/screen/question2_screen.dart';
import 'package:clam_ai/feature/auth/screen/signup_screen.dart';
import 'package:clam_ai/feature/home/screen/download_screen.dart';
import 'package:clam_ai/feature/home/screen/history_screen.dart';
import 'package:clam_ai/feature/home/screen/home_screen.dart';
import 'package:clam_ai/feature/home/screen/profile_screen.dart';
import 'package:clam_ai/feature/home/screen/setting_screen.dart';
import 'package:clam_ai/feature/home/screen/starts_season.dart';
import 'package:clam_ai/feature/home/screen/terms_and_privacy_policy_screen.dart';
import 'package:clam_ai/feature/splash/main_screen.dart';
import 'package:clam_ai/route/route_name.dart';
import 'package:get/get.dart';

import '../feature/auth/screen/language_screen.dart';
import '../feature/auth/screen/question3_screen.dart';
import '../feature/auth/screen/question4_screen.dart';
import '../feature/auth/screen/question5_screen.dart';
import '../feature/auth/screen/question6_screen.dart';
import '../feature/auth/screen/reset_password_screen.dart';
import '../feature/auth/screen/subscription_screen.dart';
import '../feature/auth/screen/update_password_screen.dart';
import '../feature/home/screen/meditate_screen.dart';
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
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.resetpassword,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.otpScreen,
      page: () => OtpVerificationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.updatePassword,
      page: () => UpdatePasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question1,
      page: () => Question1(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question2,
      page: () => Question2(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question3,
      page: () => Question3(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question4,
      page: () => Question4(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question5,
      page: () => Question5(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.question6,
      page: () => Question6(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.subscription,
      page: () => SubscriptionScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.meditateScreen,
      page: () => MeditateScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.startSeason,
      page: () => StartSessionScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.history,
      page: () => HistoryScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.download,
      page: () => DownloadScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.setting,
      page: () => SettingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: RouteName.termsAndPrivacyPolicyScreen,
      page: () => TermsAndPrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
