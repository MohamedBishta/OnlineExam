import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/domain/repo/new_password_repo.dart';

@injectable
class NewPasswordUseCase {
  NewPasswordRepo newPasswordRepo;

  NewPasswordUseCase(this.newPasswordRepo);

  Future<Result<String>> newPassword(String email, String password) {
    return newPasswordRepo.newPassword(email, password);
  }
}
