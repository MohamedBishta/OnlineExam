import '../../../core/utils/result.dart';
import '../../../data/models/signup_input_model/SignUpModel.dart';
import '../../entity/auth_entity.dart';

abstract class AuthRepo{
  Future<Result<AuthEntity>> singUp(SignUpModel signupModel);
  Future<Result<AuthEntity>> singIn({required String email, required String password});
}