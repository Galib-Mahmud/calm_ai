import 'package:clam_ai/route/route_name.dart';
import 'package:get/get.dart';

import '../feature/splash/splash_loading_screen.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.splashloading,
      page: () => LoadingSplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),//Splash Screen
  ];
}
