abstract class EndPoints {
  static const _baseUrl = 'https://exam.elevateegy.com';
  static const getProfile = '${_baseUrl}/api/v1/auth/profileData';
  static const forgetPasswordEmailVerification =
      '${_baseUrl}/api/v1/auth/forgotPassword';
  static const resetCode = '${_baseUrl}/api/v1/auth/verifyResetCode';
  static const resetPassword = '${_baseUrl}/api/v1/auth/resetPassword';
  static const editProfile = '${_baseUrl}/api/v1/auth/editProfile';
  static const changePassword = '${_baseUrl}/api/v1/auth/changePassword';
  static const String signUpEndpoint = '${_baseUrl}/api/v1/auth/signup';
  static const String loginEndpoint = '${_baseUrl}/api/v1/auth/signin';
}
