import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../../../core/utils/result.dart';
import '../../../models/Auth/AuthResponse.dart';

abstract class AuthDataSource{
  Future<Result<AuthResponse>> SingUp(SignUpModel signupModel);

  Future<Result<AuthResponse>> SignIn({required String email,required String password});
}
