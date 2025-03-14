abstract class EndPoints {
  static const _baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const getProfile = '$_baseUrl/auth/profileData';
  static const forgetPasswordEmailVerification =
      '${_baseUrl}auth/forgotPassword';
  static const resetCode = '${_baseUrl}auth/verifyResetCode';
  static const resetPassword = '${_baseUrl}auth/resetPassword';
  static const editProfile = '$_baseUrl/auth/editProfile';
  static const changePassword = '$_baseUrl/auth/changePassword';
  static const getSubjects = '$_baseUrl/subjects';
  static const getSubjectExams='$_baseUrl/exams';
  static const getAllQuestionOnExam = '$_baseUrl/questions';
  static const checkAnswers = '$_baseUrl/questions/check';
}
