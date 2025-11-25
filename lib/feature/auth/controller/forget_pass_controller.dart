import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../core/local_storage/user_info.dart';
import '../../../route/route_name.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  // Initialize ApiClient with your base URL
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  // Step 1: Request OTP (Forgot Password - Initial Request)
  Future<void> forgetPassword() async {
    final email = emailController.text.trim();

    isLoading.value = true;

    try {
      print("🌐 [FORGET PASSWORD] Requesting OTP for email: $email");

      final response = await _apiClient.post(
        ApiEndpoint.forgetPass,
        body: {"email": email},
      );

      print("✅ [FORGET PASSWORD] Response received: $response['otp_preview']");

      if (response.containsKey("message")) {
        // Navigate to OTP verification screen with email
        Get.toNamed(RouteName.forgetPassOtpScreen, arguments: {"email": email});
      } else {
        Get.snackbar(
          "Error",
          response["error"] ?? "Failed to send OTP",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade900,
        );
      }
    } catch (e) {
      print("🔥 [FORGET PASSWORD] Exception caught: $e");
      Get.snackbar(
        "Error",
        "Failed to send OTP: ${e.toString()}",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    } finally {
      print("🔚 [FORGET PASSWORD] Request finished");
      isLoading.value = false;
    }
  }

  // Step 2: Verify OTP
  Future<void> verifyOtp(String email, String otpCode) async {
    if (email.isEmpty || otpCode.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and OTP are required",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    isLoading.value = true;

    try {
      print("🌐 [VERIFY OTP] Verifying OTP for email: $email");

      final response = await _apiClient.post(
        ApiEndpoint.verifyForgetPass,
        // Make sure this endpoint is correct for forgot password OTP verification
        body: {"email": email, "code": otpCode},
      );

      print("✅ [VERIFY OTP] Response received: $response");

      if (response.containsKey("message")) {
        // Navigate to reset password screen with email
        Get.toNamed(RouteName.updatePassword, arguments: {"email": email});
      } else {
        Get.snackbar(
          "Error",
          response["message"] ?? response["error"] ?? "Invalid OTP",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade900,
        );
      }
    } catch (e) {
      print("🔥 [VERIFY OTP] Exception caught: $e");
      Get.snackbar(
        "Error",
        "OTP verification failed: ${e.toString()}",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    } finally {
      print("🔚 [VERIFY OTP] Verification finished");
      isLoading.value = false;
    }
  }

  // Step 3: Reset Password (after OTP verification)
  Future<void> resetPassword(String email) async {
    final newPassword = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    if (email.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    if (newPassword.length < 6) {
      Get.snackbar(
        "Error",
        "Password must be at least 6 characters",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    isLoading.value = true;

    try {
      print("🌐 [RESET PASSWORD] Resetting password for email: $email");

      final response = await _apiClient.post(
        ApiEndpoint.resetPassword, // Make sure you have this endpoint
        body: {
          "email": email,
          "password": newPassword,
          "confirm_password": confirmPassword,
        },
      );

      print("✅ [RESET PASSWORD] Response received: $response");

      if (response.containsKey("message")) {
        Get.snackbar(
          "Success",
          response["message"] ?? "Password reset successfully!",
          backgroundColor: Colors.green.shade100,
          colorText: Colors.green.shade900,
        );

        // Navigate to login screen
        Get.offAllNamed(RouteName.homeScreen);
      } else {
        Get.snackbar(
          "Error",
          response["error"] ?? "Failed to reset password",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade900,
        );
      }
    } catch (e) {
      print("🔥 [RESET PASSWORD] Exception caught: $e");
      Get.snackbar(
        "Error",
        "Password reset failed: ${e.toString()}",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    } finally {
      print("🔚 [RESET PASSWORD] Reset finished");
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
