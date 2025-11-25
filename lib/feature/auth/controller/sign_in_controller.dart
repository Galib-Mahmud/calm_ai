
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../core/local_storage/user_info.dart';
import '../../../route/route_name.dart';

class SignInController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  // Initialize ApiClient with your base URL
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  Future<void> loginUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
      return;
    }

    isLoading.value = true;

    try {
      print("🌐 [LOGIN] Calling API using ApiClient...");
      final response = await _apiClient.post(
        ApiEndpoint.signin, // e.g. "/api/login/"
        body: {
          "username": name,
          "email": email,
          "password": password,
        },
      );




      print("✅ [LOGIN] Response received: $response");



      // Safely extract token values
      final accessToken = response['token'];
      // final refreshToken = response['data']?['tokens']?['refresh'];

      if(response.containsKey("token")){
        Get.toNamed(RouteName.homeScreen);
      }

      if (accessToken != null ) {
        UserInfo.setAccessToken(accessToken);
        // UserInfo.setRefreshToken(refreshToken);
        print("🟢 [LOGIN] Tokens saved successfully!");
      } else {
        print("🚫 [LOGIN] Tokens missing in response");
        Get.snackbar("Error", "Invalid response from server");
      }
    } catch (e) {
      print("🔥 [LOGIN] Exception caught: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      print("🔚 [LOGIN] Login process finished");
      isLoading.value = false;
    }
  }
  }