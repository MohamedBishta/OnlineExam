import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../core/utils/result.dart';
import '../repo/auth_repo/auth_repo.dart';
@injectable
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);
  Future<Result> call(SignUpModel signupModel )=> authRepo.SingUp(signupModel);
}