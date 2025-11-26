import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';
import '../controller/onboarding_controller.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  // Get or create the controller
  final OnboardingController controller = Get.put(OnboardingController());

  final List<String> options = [
    'Reduce stress',
    'Better sleep',
    'Reduce anxiety',
    'Improve focus',
    'Build self-confidence',
  ];

  final List<String> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    // Load previously selected options if any
    if (controller.selectedGoals.isNotEmpty) {
      selectedOptions.addAll(controller.selectedGoals);
    }
  }

  void _handleOptionTap(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        if (selectedOptions.length < 2) {
          selectedOptions.add(option);
        } else {
          Get.snackbar(
            'Limit reached',
            'You can select up to two options',
            backgroundColor: Colors.orange.shade100,
            colorText: Colors.orange.shade900,
          );
        }
      }
    });
  }

  void _handleNext() {
    if (selectedOptions.isEmpty) {
      Get.snackbar(
        'Selection required',
        'Please select at least one goal',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    // Save to controller
    controller.setMindfulnessGoals(selectedOptions);

    // Navigate to next question
    Get.toNamed(RouteName.question2);
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
                    controller.skipOnboarding();
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
                'Question 1/6',
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
                value: 1 / 6,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF07657E)),
              ),

              SizedBox(height: 24.h),

              // Question Text
              Text(
                '1. What are your main mindfulness goals?',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                '(Pick one or two)',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  fontFamily: 'Roboto',
                ),
              ),

              SizedBox(height: 24.h),

              // Options
              ...options.map(
                    (option) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: GestureDetector(
                    onTap: () => _handleOptionTap(option),
                    child: Row(
                      children: [
                        Icon(
                          selectedOptions.contains(option)
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: selectedOptions.contains(option)
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
                              color: selectedOptions.contains(option)
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
                padding: EdgeInsets.only(bottom: 105.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: _handleNext,
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