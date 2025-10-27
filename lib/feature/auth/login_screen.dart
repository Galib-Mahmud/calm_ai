import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../route/route_name.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                'Login',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DM Serif Display',
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                'Access to your account',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 32.h),

              // Name input field
              TextField(

                decoration: InputDecoration(
                  hintText: 'Enter your name',
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

              SizedBox(height: 16.h),

              // Email input field
              TextField(
                controller: emailController,
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

              SizedBox(height: 16.h),

              // Password input field
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.sp,
                    fontFamily: 'Roboto',
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey[600],
                      size: 22.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
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

              SizedBox(height: 24.h),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login
                    print('Name: ${nameController.text}');
                    print('Email: ${emailController.text}');
                    print('Password: ${passwordController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07657E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Login',
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

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                   Get.toNamed(RouteName.resetpassword);
                  },
                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14.sp,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              // Divider with text
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.4),
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.4),
                      thickness: 2,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Sign up link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.signup);

                      },
                      child: Text(
                        ' Sign up',
                        style: TextStyle(
                          color: Color(0xFF07657E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}