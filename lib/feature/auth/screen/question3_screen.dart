import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../route/route_name.dart';

class Question3 extends StatefulWidget {
  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  final List<String> options = [
    'Morning',
    'Afternoon',
    'Evening',
    'Just before bed',
    "I don't have a routine yet",
  ];

  String? selectedOption;

  void _handleNext() {
    if (selectedOption == null) {
      Get.snackbar(
        'Selection required',
        'Please select your typical meditation time',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    print('Selected: $selectedOption');
    // Navigate to next question
    // Get.toNamed('/next-question');
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
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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

              // Question Progress
              Text(
                'Question 3/6',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 8.h),

              LinearProgressIndicator(
                value: 3 / 6,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF07657E)),
              ),

              SizedBox(height: 24.h),

              // Question Text
              Text(
                '3. When do you typically meditate?',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
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

              // Next button
              Padding(
                padding: EdgeInsets.only(bottom: 85.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.question4);
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
