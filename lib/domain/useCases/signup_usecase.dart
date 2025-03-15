import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../core/utils/result.dart';
import '../../data/models/Auth/AuthResponse.dart';
import '../entity/auth_entity.dart';
import '../repo/auth_repo/auth_repo.dart';
@injectable
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);
  Future<Result<AuthEntity>> call(SignUpModel signupModel)=> authRepo.singUp(signupModel);
}