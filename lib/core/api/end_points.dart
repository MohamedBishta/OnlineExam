abstract class EndPoints {
  static const String signUpEndpoint = '$_baseUrl/api/v1/auth/signup';
  static const String loginEndpoint = '$_baseUrl/api/v1/auth/signin';
  static const String _baseUrl = 'https://exam.elevateegy.com';
  static const String getProfile = '$_baseUrl/api/v1/auth/profileData';
}
