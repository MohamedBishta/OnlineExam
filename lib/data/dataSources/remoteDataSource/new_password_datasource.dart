import 'package:online_exam/core/utils/result.dart';

abstract class NewPasswordDataOnlineSource {
  Future<Result<String>> newPassword(String email, String password);
}
