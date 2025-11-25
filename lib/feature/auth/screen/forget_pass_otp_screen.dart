import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import '../../../route/route_name.dart';
import '../controller/forget_pass_controller.dart';

class ForgetPassOtp extends StatefulWidget {
  @override
  _ForgetPassOtpState createState() => _ForgetPassOtpState();
}

class _ForgetPassOtpState extends State<ForgetPassOtp> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  final List<TextEditingController> otpControllers = List.generate(
    6,
        (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    6,
        (index) => FocusNode(),
  );

  int _remainingSeconds = 49;
  Timer? _timer;
  bool _canResend = false;

  // Get email from route arguments
  String email = '';

  @override
  void initState() {
    super.initState();
    // Get email from navigation arguments
    email = Get.arguments?['email'] ?? '';
    if (email.isEmpty) {
      print('⚠️ Warning: No email provided in navigation arguments');
    }
    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = 49;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  String getOtp() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void _handleOtpChange(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
  }



  void _submitOtp() {
    String otp = getOtp();

    // Check if email is available
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email not found. Please go back and try again.',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    // Check for 6 digits
    if (otp.length != 6) {
      Get.snackbar(
        'Error',
        'Please enter complete 6-digit OTP',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    // Handle OTP verification - FIXED: Call verifyOtp method
    print('Verifying OTP: $otp for email: $email');
    forgetPasswordController.verifyOtp(email, otp);
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
          padding: EdgeInsets.only(
            top: 60.h,
            bottom: 24.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Get.offAllNamed(RouteName.home);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Logo
              Center(
                child: Image.asset(
                  'assets/images/auth/logo1.png',
                  height: 104.h,
                  width: 104.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 32.h),

              // Title
              Text(
                'Enter otp',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                'An OTP has been sent to your email',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 30.h),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    height: 56.h,
                    width: 50.w,
                    child: TextField(
                      controller: otpControllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                        fillColor: Colors.white,
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        setState(() {
                          _handleOtpChange(value, index);
                        });
                      },
                      onTap: () {
                        otpControllers[index].selection = TextSelection.fromPosition(
                          TextPosition(offset: otpControllers[index].text.length),
                        );
                      },
                      onEditingComplete: () {
                        if (index < 5) {
                          focusNodes[index + 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // Submit button with loading state
              Obx(() => SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: forgetPasswordController.isLoading.value
                      ? null
                      : _submitOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07657E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Color(0xFF07657E).withOpacity(0.6),
                  ),
                  child: forgetPasswordController.isLoading.value
                      ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              )),

              SizedBox(height: 16.h),


            ],
          ),
        ),
      ),
    );
  }
}