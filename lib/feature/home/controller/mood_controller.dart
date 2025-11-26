import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../core/local_storage/user_info.dart';
import '../../../route/route_name.dart';

class MoodController extends GetxController {
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  // Observables
  final isLoadingMoods = false.obs;
  final isLoadingQuestions = false.obs;
  final moods = <String>[].obs;
  final selectedMood = ''.obs;
  final questions = <MoodQuestion>[].obs;
  final answers = <String, String>{}.obs; // questionIndex -> answer
  final  selectedBackground = 'No background noise'.obs;
 final  selectedVoice = 'Female'.obs;

 RxBool isLoadingSubmit = false.obs;


  @override
  void onInit() async {
    super.onInit();
    await fetchMoods();
    fetchQuestionsByMood(moods[1]);

  }

  // Fetch available moods
  Future<void> fetchMoods() async {
    print('fetch mood call');
    isLoadingMoods.value = true;
    try {
      print("🌐 [MOOD] Fetching moods...");

      final token = await UserInfo.getAccessToken();

      final response = await _apiClient.get(
        ApiEndpoint.getMoods,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("✅ [MOOD] Moods response code: $response.s");

      if (response['moods'] != null) {
        moods.value = List<String>.from(response['moods']);

        // Capitalize first letter of each mood for display
        moods.value = moods.map((mood) =>
        mood[0].toUpperCase() + mood.substring(1)
        ).toList();

        // Set default selected mood
        if (moods.isNotEmpty) {
          selectedMood.value = moods[1]; // Default to "Tired" (index 1)
        }

        print("✅ [MOOD] Moods loaded: $moods");
      }
    } catch (e) {
      print("🔥 [MOOD] Error fetching moods: $e");

    } finally {
      isLoadingMoods.value = false;
    }
  }

  // Fetch questions for selected mood
  Future<void> fetchQuestionsByMood(String mood) async {
    isLoadingQuestions.value = true;
    answers.clear(); // Clear previous answers

    try {
      print("🌐 [MOOD] Fetching questions for mood: $mood");

      final token = await UserInfo.getAccessToken();

      // Convert mood to lowercase for API
      final moodLower = mood.toLowerCase();

      final response = await _apiClient.get(
        '${ApiEndpoint.getQuestionsByMood}?mood=$moodLower',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("✅ [MOOD] Questions response: $response");

      if (response['questions'] != null) {
        questions.value = (response['questions'] as List)
            .map((q) => MoodQuestion.fromJson(q))
            .toList();

        print("✅ [MOOD] ${questions.length} questions loaded");
      }
    } catch (e) {
      print("🔥 [MOOD] Error fetching questions: $e");
      Get.snackbar(
        "Error",
        "Failed to load questions. Please try again.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    } finally {
      isLoadingQuestions.value = false;
    }
  }

  // Set selected mood and fetch questions
  void setMood(String mood) {
    selectedMood.value = mood;
    print("✅ [MOOD] Mood selected: $mood");
    fetchQuestionsByMood(mood);
  }

  // Save answer for a question
  void setAnswer(int questionIndex, String answer) {
    answers[questionIndex.toString()] = answer;
    print("✅ [MOOD] Answer saved - Q${questionIndex + 1}: $answer");
  }

  // Check if all questions are answered
  bool areAllQuestionsAnswered() {
    return answers.length == questions.length;
  }

  // Submit mood check-in
  Future<void> submitMoodCheckin() async {
    isLoadingSubmit.value = true;
    if (!areAllQuestionsAnswered()) {
      Get.snackbar(
        "Incomplete",
        "Please answer all questions",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.orange.shade900,
      );
      return;
    }

    try {
      print("🚀 [MOOD] Submitting mood check-in...");
      print("   Mood: ${selectedMood.value}");
      print("   Answers: $answers");

      final token = await UserInfo.getAccessToken();

      // Prepare answers in the format expected by your API
      // Convert entries to a list
      final sortedEntries = answers.entries.toList()
        ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));

// Map to values and wrap under "answer"
      final answersForApi = answers.entries
          .map((e) => e.value)
          .toList();







      final requestBody = {
        "mood": selectedMood.value.toLowerCase(),
        "voice": selectedVoice.value.toLowerCase(),
        "background": selectedBackground.value.toLowerCase(),
        "answers": answersForApi,
      };

      print("📦 [MOOD] Request body: $requestBody");

      final response = await _apiClient.post(
        ApiEndpoint.submitMoodCheckin,
        body: requestBody,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("✅ [MOOD] Response: $response");

      if(response.containsKey("session_id")) {
        Get.toNamed(RouteName.startSeason);

        // Navigate to meditation screen or wherever needed
        // Get.toNamed(RouteName.meditateScreen);
      }
    } catch (e) {
      print("🔥 [MOOD] Error submitting: $e");
      Get.snackbar(
        "Error",
        "Failed to submit. Please try again.",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
    }
    finally {
      isLoadingSubmit.value = false;
    }
  }



  void clearData() {
    questions.clear();
    answers.clear();
  }
}

// Model for mood question
class MoodQuestion {
  final String question;
  final List<String> options;

  MoodQuestion({
    required this.question,
    required this.options,
  });

  factory MoodQuestion.fromJson(Map<String, dynamic> json) {
    return MoodQuestion(
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
    );
  }
}