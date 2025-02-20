import 'package:online_exam/core/utils/result.dart';

abstract class OtpCodeDataOnlineSource {
  Future<Result<String>> getOtpCode(String code);
}
