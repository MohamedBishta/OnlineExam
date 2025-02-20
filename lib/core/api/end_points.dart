abstract class EndPoints {
  static const _baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const getProfile = '$_baseUrl/auth/profileData';
  static const forgetPasswordEmailVerification='${_baseUrl}auth/forgotPassword';
  static const resetCode='${_baseUrl}auth/verifyResetCode';
  static const resetPassword='${_baseUrl}auth/resetPassword';
}
