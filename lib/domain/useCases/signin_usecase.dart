import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';

import '../repo/auth_repo/auth_repo.dart';

@injectable
class SigninUsecase{
  AuthRepo authRepo;
  @factoryMethod
  SigninUsecase(this.authRepo);
  Future<Result> call({required String email, required String password})=> authRepo.SingIn(email: email, password: password);
}