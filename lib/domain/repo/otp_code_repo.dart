import '../../core/utils/result.dart';

abstract class OtpCodeRepo {
  Future<Result<String>> getOtpCode(String code);
}
