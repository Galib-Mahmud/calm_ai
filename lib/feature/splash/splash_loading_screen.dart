import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../route/route_name.dart';

class LoadingSplashScreen extends StatefulWidget {
  const LoadingSplashScreen({super.key});

  @override
  State<LoadingSplashScreen> createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate after delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteName.language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          height: 852.h,
          width: 393.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/auth/background.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(
                  'assets/images/auth/logo.png',
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Calm AI',
                  style: TextStyle(
                    fontSize: 48.sp,
                    color: Color(0xFF07657E),
                    letterSpacing: 0.sp,
                    fontFamily: 'DM Serif Display',
                    fontWeight: FontWeight.w400

                  ),
                )
              ],

            ),
          ),
        ),
        );
    }
}
