import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/domain/repo/otp_code_repo.dart';

@injectable
class OtpCodeUseCase {
  OtpCodeRepo otpCodeRepo;
  OtpCodeUseCase(this.otpCodeRepo);

  Future<Result<String>> getOtpCode(String code) {
    return otpCodeRepo.getOtpCode(code);
  }
}
