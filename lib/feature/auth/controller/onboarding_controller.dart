import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../core/local_storage/user_info.dart';
import '../../../route/route_name.dart';

class OnboardingController extends GetxController {
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  // Observables for loading state
  final isLoading = false.obs;

  // Store user's onboarding answers
  final selectedGoals = <String>[].obs;
  final experienceLevel = Rxn<String>();
  final meditationTime = Rxn<String>();
  final sessionLength = Rxn<String>();
  final voicePreference = Rxn<String>();
  final stressLevel = Rxn<String>();

  // Question 1: Set mindfulness goals (max 2)
  void setMindfulnessGoals(List<String> goals) {
    selectedGoals.value = goals;
    print("✅ [ONBOARDING] Goals selected: $goals");
  }

  // Question 2: Set experience level
  void setExperienceLevel(String level) {
    experienceLevel.value = level;
    print("✅ [ONBOARDING] Experience level: $level");
  }

  // Question 3: Set meditation time
  void setMeditationTime(String time) {
    meditationTime.value = time;
    print("✅ [ONBOARDING] Meditation time: $time");
  }

  // Question 4: Set session length
  void setSessionLength(String length) {
    sessionLength.value = length;
    print("✅ [ONBOARDING] Session length: $length");
  }

  // Question 5: Set voice preference
  void setVoicePreference(String voice) {
    voicePreference.value = voice;
    print("✅ [ONBOARDING] Voice preference: $voice");
  }

  // Question 6: Set stress level
  void setStressLevel(String stress) {
    stressLevel.value = stress;
    print("✅ [ONBOARDING] Stress level: $stress");
  }

  // Validate if all required fields are filled
  bool isOnboardingComplete() {
    final isComplete = selectedGoals.isNotEmpty &&
        experienceLevel.value != null &&
        meditationTime.value != null &&
        sessionLength.value != null &&
        voicePreference.value != null &&
        stressLevel.value != null;

    print("🔍 [ONBOARDING] Validation check: $isComplete");
    if (!isComplete) {
      print("❌ [ONBOARDING] Missing fields:");
      print("   - Goals: ${selectedGoals.isEmpty ? 'MISSING' : 'OK'}");
      print("   - Experience: ${experienceLevel.value == null ? 'MISSING' : 'OK'}");
      print("   - Meditation Time: ${meditationTime.value == null ? 'MISSING' : 'OK'}");
      print("   - Session Length: ${sessionLength.value == null ? 'MISSING' : 'OK'}");
      print("   - Voice: ${voicePreference.value == null ? 'MISSING' : 'OK'}");
      print("   - Stress: ${stressLevel.value == null ? 'MISSING' : 'OK'}");
    }

    return isComplete;
  }

  // Submit onboarding data to API
  Future<void> submitOnboarding() async {
    print("🚀 [ONBOARDING] Starting submission process...");

    if (!isOnboardingComplete()) {
      Get.snackbar(
        "Incomplete",
        "Please complete all questions",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.orange.shade900,
      );
      return;
    }

    isLoading.value = true;

    try {
      print("🔑 [ONBOARDING] Getting access token...");

      // Get the access token
      final token = await UserInfo.getAccessToken();

      print("🔑 [ONBOARDING] Token retrieved: ${token != null ? 'YES' : 'NO'}");

      if (token == null || token.isEmpty) {
        print("❌ [ONBOARDING] Token is null or empty");
        Get.snackbar("Error", "Authentication token not found. Please login again.");
        Get.offAllNamed(RouteName.login);
        return;
      }

      // Prepare the request body
      final requestBody = {
        "mindfulness_goal": selectedGoals.first, // Using first goal as per API
        "experience_level": experienceLevel.value,
        "meditation_time": meditationTime.value,
        "session_length": sessionLength.value,
        "voice_preference": voicePreference.value,
        "stress_level": stressLevel.value,
      };

      print("📦 [ONBOARDING] Request body prepared:");
      print("   URL: ${ApiEndpoint.baseUrl}${ApiEndpoint.onboardingSubmit}");
      print("   Body: $requestBody");
      print("   Token: Bearer ${token.substring(0, 20)}...");

      // Call the API
      final response = await _apiClient.post(
        ApiEndpoint.onboardingSubmit,
        body: requestBody,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("✅ [ONBOARDING] Response received:");

      print("   Response: $response");

      // Handle successful response - check multiple possible success indicators
      if (response.containsKey("message") ) {

        Get.toNamed(RouteName.mainScreen);

        print("🎉 [ONBOARDING] Submission successful!");



        // Clear onboarding data
        clearOnboardingData();

        // Small delay to show success message
        await Future.delayed(Duration(milliseconds: 500));



      } else {
        print("⚠️ [ONBOARDING] Unexpected response format");
        Get.snackbar(
          "Error",
          response['message'] ?? "Failed to submit onboarding",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade900,
        );
      }
    } catch (e, stackTrace) {
      print("🔥 [ONBOARDING] Exception caught:");
      print("   Error: $e");
      print("   Stack trace: $stackTrace");

      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    } finally {
      print("🔚 [ONBOARDING] Submission process finished");
      isLoading.value = false;
    }
  }

  // Skip onboarding
  void skipOnboarding() {
    print("⏭️ [ONBOARDING] User skipped onboarding");
    clearOnboardingData();
    Get.offAllNamed(RouteName.subscription);
  }

  // Clear all onboarding data
  void clearOnboardingData() {
    print("🧹 [ONBOARDING] Clearing all data");
    selectedGoals.clear();
    experienceLevel.value = null;
    meditationTime.value = null;
    sessionLength.value = null;
    voicePreference.value = null;
    stressLevel.value = null;
  }

  // Get progress percentage
  double getProgress(int questionNumber) {
    return questionNumber / 6;
  }

  // Print current state (for debugging)
  void printCurrentState() {
    print("📊 [ONBOARDING] Current State:");
    print("   Goals: $selectedGoals");
    print("   Experience: ${experienceLevel.value}");
    print("   Meditation Time: ${meditationTime.value}");
    print("   Session Length: ${sessionLength.value}");
    print("   Voice Preference: ${voicePreference.value}");
    print("   Stress Level: ${stressLevel.value}");
  }

  @override
  void onClose() {
    print("👋 [ONBOARDING] Controller closing");
    super.onClose();
  }
}