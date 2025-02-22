import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';

import '../repo/auth_repo/auth_repo.dart';
@injectable
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);
  Future<Result> call({required String userName, required String firstName, required String lastName, required String email, required String password, required String confirmPassword, required String phone})=> authRepo.SingUp(userName: userName, firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword, phone: phone);
}