abstract class EndPoints {
  static const _baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const getProfile = '$_baseUrl/auth/profileData';
  static const forgetPasswordEmailVerification =
      '${_baseUrl}auth/forgotPassword';
  static const resetCode = '${_baseUrl}auth/verifyResetCode';
  static const resetPassword = '${_baseUrl}auth/resetPassword';
  static const editProfile = '$_baseUrl/auth/editProfile';
  static const changePassword = '$_baseUrl/auth/changePassword';
  static const String signUpEndpoint = '$_baseUrl/api/v1/auth/signup';
  static const String loginEndpoint = '$_baseUrl/api/v1/auth/signin';
  static const String _baseUrl = 'https://exam.elevateegy.com';
  static const String getProfile = '$_baseUrl/api/v1/auth/profileData';
}
