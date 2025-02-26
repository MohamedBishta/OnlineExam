import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/domain/repo/forget_password_repo.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo forgetpasswordrepo;
  ForgetPasswordUseCase(this.forgetpasswordrepo);

  Future<Result<String?>> forgetPassword(String email) async {
    var forgetData = await forgetpasswordrepo.forgetPassword(email);

    return forgetData;
  }
}
