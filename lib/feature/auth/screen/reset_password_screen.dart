import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';
import '../controller/forget_pass_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ForgetPasswordController forgetPassController = Get.put(ForgetPasswordController());


  bool isPasswordVisible = false;



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
          padding: EdgeInsets.only( top: 60.h,
              bottom: 24.h,
              left: 24.w,
              right: 24.w  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Handle skip action
                    Navigator.pushReplacementNamed(context, '/home');
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

              SizedBox(height: 10.h),

              // Logo
              Center(
                child: Image.asset(
                  'assets/images/auth/logo1.png',
                  height: 104.h,
                  width: 104.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 15.h),

              // Title
              Text(
                'Reset your password',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,

                  color: Colors.black,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                'We’ll send you an OTP to reset your password',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 32.h),


              // Email input field
              TextField(
                controller: forgetPassController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.sp,
                    fontFamily: 'Roboto',
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Color(0xFF07657E),
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                ),
              ),
              SizedBox(height: 32.h),


              // Login button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {


                    forgetPassController.forgetPassword();

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07657E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      color: Colors.white,
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