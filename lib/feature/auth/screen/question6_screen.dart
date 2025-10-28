import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';

class Question6 extends StatefulWidget {
  @override
  _Question6State createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  final List<String> options = [
    'Low',
    'Average',
    'High',
  ];

  String? selectedOption;

  void _handleNext() {
    if (selectedOption == null) {
      Get.snackbar(
        'Selection required',
        'Please select your current stress level',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    print('Selected: $selectedOption');
    // Proceed to summary or dashboard
    // Get.toNamed('/onboarding-summary');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 45.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Get.offAllNamed('/home');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              // Logo
              Center(
                child: Image.asset(
                  'assets/images/auth/logo1.png',
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 16.h),

              // Progress
              Text(
                'Question 6/6',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 8.h),

              LinearProgressIndicator(
                minHeight: 7.h,
                borderRadius: BorderRadius.circular(10.r),
                value: 6 / 6,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF07657E)),
              ),

              SizedBox(height: 24.h),

              // Question Text
              Text(
                '6. How would you describe your current stress level?',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,

                  color: Colors.black,
                ),
              ),

              SizedBox(height: 24.h),

              // Options
              ...options.map(
                    (option) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedOption = option),
                    child: Row(
                      children: [
                        Icon(
                          selectedOption == option
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: selectedOption == option
                              ? Color(0xFF07657E)
                              : Colors.grey,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Roboto',
                              color: selectedOption == option
                                  ? Color(0xFF07657E)
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),

              // Next Button
              Padding(
                padding:  EdgeInsets.only(bottom: 105.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.subscription);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF07657E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
