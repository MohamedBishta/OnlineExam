
import '../../../core/utils/result.dart';

abstract class ForgetPasswordOnlineDataSource {
  Future<Result<String?>> forgetPassword(String email);
}
