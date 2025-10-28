import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import '../../../route/route_name.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    5,
        (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    5,
        (index) => FocusNode(),
  );

  int _remainingSeconds = 49;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
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
    if (value.isNotEmpty && index < 4) {
      focusNodes[index + 1].requestFocus();
    }
  }

  void _handleBackspace(String value, int index) {
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void _resendOtp() {
    if (_canResend) {
      // Handle resend OTP logic
      print('Resending OTP...');
      Get.snackbar(
        'Success',
        'OTP has been resent to your email',
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green.shade900,
      );
      _startTimer();
    }
  }

  void _submitOtp() {
    String otp = getOtp();
    if (otp.length != 5) {
      Get.snackbar(
        'Error',
        'Please enter complete OTP',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    // Handle OTP verification
    print('Verifying OTP: $otp');
    // Navigate to set new password screen
    // Get.toNamed(RouteName.setNewPassword);
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
                  5,
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
                            if (index < 4) {
                              focusNodes[index + 1].requestFocus();
                            }
                          },
                        ),
                      ),
                ),
              ),

              SizedBox(height: 32.h),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteName.updatePassword);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07657E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Resend OTP
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend OTP : ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.sp,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    GestureDetector(
                      onTap: _resendOtp,
                      child: Text(
                        _canResend
                            ? 'Resend'
                            : '(00:${_remainingSeconds.toString().padLeft(2, '0')})',
                        style: TextStyle(
                          color: _canResend ? Color(0xFF07657E) : Colors.grey[500],
                          fontSize: 14.sp,
                          fontWeight: _canResend ? FontWeight.w600 : FontWeight.w400,
                          fontFamily: 'Roboto',
                          decoration: _canResend ? TextDecoration.underline : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
