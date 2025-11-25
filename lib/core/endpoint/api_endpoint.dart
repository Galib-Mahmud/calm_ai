class ApiEndpoint {
  static const String baseUrl = "http://10.10.7.98:8000";


  static const String signup = "/api/auth/register";
  static const String Otp = "/api/auth/verify-otp";
  static const String signin = "/api/auth/login";
  static const String forgetPass = "/api/auth/forgot-password";
  static const String verifyForgetPass = "/api/auth/verify-reset-otp";
  static const String resetPassword = "/api/auth/reset-password";

}