import 'package:clam_ai/route/app_route.dart';
import 'package:clam_ai/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';




import 'core/theme/color_theme.dart'; // import theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme, // ✅ use theme her
          initialRoute: RouteName.splashloading,
          getPages: AppRoute.pages,
        );
      },
    );
  }
}
