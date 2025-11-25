import 'package:get/get.dart';
import '../../../core/endpoint/api_client.dart';
import '../../../core/endpoint/api_endpoint.dart';
import '../../../route/route_name.dart';

class OtpController extends GetxController {
  final ApiClient _apiClient = ApiClient(baseUrl: ApiEndpoint.baseUrl);

  Future<void> verifyOtp(String email, String otpCode) async {
    try {
      print("🌐 [OTP VERIFY] Sending OTP verification request...");

      final response = await _apiClient.post(
        ApiEndpoint.Otp,
        body: {
          "email": email,
          "code": otpCode,
        },
      );

      print("🔎 [OTP VERIFY] Response: $response");

      if (response.containsKey("message"))
           {
       Get.toNamed(RouteName.login);

        // Get.toNamed(RouteName.loginScreen);
      } else {
        Get.snackbar("Error", response["message"] ?? "Invalid OTP");
      }
    } catch (e) {
      print("🔥 [OTP VERIFY] Exception: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
