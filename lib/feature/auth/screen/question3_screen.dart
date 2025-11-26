import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';
import '../controller/onboarding_controller.dart';

class Question3 extends StatefulWidget {
  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  // Get the controller instance
  final OnboardingController controller = Get.find<OnboardingController>();

  final List<String> options = [
    'Morning',
    'Afternoon',
    'Evening',
    'Just before bed',
    "I don't have a routine yet",
  ];

  String? selectedOption;

  @override
  void initState() {
    super.initState();
    // Load previously selected option if any
    selectedOption = controller.meditationTime.value;
  }

  void _handleOptionTap(String option) {
    setState(() {
      selectedOption = option;
    });
    // Save to controller immediately when option is selected
    controller.setMeditationTime(option);
  }

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

    // Save to controller (in case not saved yet)
    controller.setMeditationTime(selectedOption!);

    // Navigate to next question
    Get.toNamed(RouteName.question4);
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
                minHeight: 7.h,
                borderRadius: BorderRadius.circular(10.r),
                value: 3 / 6,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF07657E)),
              ),

              SizedBox(height: 24.h),

              // Question Text
              Text(
                '3. When do you typically meditate?',
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
                    onTap: () {
                      _handleOptionTap(option);
                      print("🔵 [Q3] Option tapped: $option");
                    },
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