import 'package:online_exam/core/utils/result.dart';

abstract class ForgetPasswordRepo {
  Future<Result<String?>> forgetPassword(String email);
}
