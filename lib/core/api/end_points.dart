abstract class EndPoints {
  static const String signUpEndpoint = '/api/v1/auth/signup';
  static const String loginUpEndpoint = '/api/v1/auth/signin';
  static const _baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const getProfile = '$_baseUrl/auth/profileData';
}
