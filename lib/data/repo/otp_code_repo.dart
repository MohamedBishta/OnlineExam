import 'package:injectable/injectable.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/otp_code_datasource.dart';
import 'package:online_exam/domain/repo/otp_code_repo.dart';
import '../../core/utils/result.dart';

@Injectable(as: OtpCodeRepo)
class OtpCodeRepoImpl implements OtpCodeRepo {
  OtpCodeDataOnlineSource otpCodeDataOnlineSource;
  OtpCodeRepoImpl(this.otpCodeDataOnlineSource);
  @override
  Future<Result<String>> getOtpCode(String code) {
    return otpCodeDataOnlineSource.getOtpCode(code);
  }
}
