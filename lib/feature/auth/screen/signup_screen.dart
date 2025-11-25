import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupController controller = Get.put(SignupController());
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

          image: DecorationImage(


            image: AssetImage("assets/images/auth/background.png",


            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Skip button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                /// Logo
                Center(
                  child: Image.asset(
                    "assets/images/auth/logo1.png",
                    height: 104.h,
                    width: 104.w,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Title
                Text(
                  "Sign Up",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 4.h),

                /// Subtitle
                Text(
                  "Access to your account",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 32.h),

                /// Full Name
                _inputField(
                  controller: controller.nameController,
                  hint: "Enter your full name",
                  keyboard: TextInputType.name,
                ),

                SizedBox(height: 16.h),

                /// Email
                _inputField(
                  controller: controller.emailController,
                  hint: "Enter your email address",
                  keyboard: TextInputType.emailAddress,
                ),

                SizedBox(height: 16.h),

                /// Password
                _passwordField(
                  controller: controller.passwordController,
                  hint: "Password",
                ),

                SizedBox(height: 16.h),

                /// Confirm Password
                _passwordField(
                  controller: controller.confirmPasswordController,
                  hint: "Confirm Password",
                ),

                SizedBox(height: 28.h),

                /// Signup Button
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF07657E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black45)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("or continue with"),
                    ),
                    Expanded(child: Divider(color: Colors.black45)),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Already have account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteName.login),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFF07657E),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable input field
  Widget _inputField({required TextEditingController controller, required String hint, required TextInputType keyboard}) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: _outlineBorder(),
        enabledBorder: _outlineBorder(color: Colors.grey),
        focusedBorder: _outlineBorder(color: Color(0xFF07657E), width: 2),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }

  /// Password field with toggle
  Widget _passwordField({required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: _outlineBorder(),
        enabledBorder: _outlineBorder(color: Colors.grey),
        focusedBorder: _outlineBorder(color: Color(0xFF07657E), width: 2),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }

  OutlineInputBorder _outlineBorder({Color color = Colors.transparent, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
