
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../route/route_name.dart';


class SignupController extends GetxController {
  // Text Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable variables
  final isPasswordVisible = true.obs;
  final isConfirmPasswordVisible = true.obs;
  final isLoading = false.obs;

  // Initialize ApiClient with base URL
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  // Toggle functions
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  // Main Register Function
  Future<void> register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;
    print("✅ [REGISTER] Register function called");

    try {
      final response = await _apiClient.post(
        ApiEndpoint.signup, // e.g. "/api/register/"
        body: {
          "username": name,
          "email": email,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );

      print("✅ [REGISTER] Response received: $response");



      if (response.containsKey("otp_preview")) {
        print("🟢 [REGISTER] Registration Successful");

        Get.toNamed(RouteName.otpScreen, arguments: {
          "email": email,

        });

      } else {
        print("⚠️ [REGISTER] Registration Failed: ");

      }
    } catch (e) {
      print("🔥 [REGISTER] Exception caught: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
      print("⏹️ [REGISTER] Loading stopped");
    }
  }
}
