import '../../../core/utils/result.dart';
import '../../../data/models/Auth/AuthResponse.dart';
import '../../../data/models/signup_input_model/SignUpModel.dart';

abstract class AuthRepo{
  Future<Result<AuthResponse>> SingUp(SignUpModel signupModel);
  Future<Result<AuthResponse>> SingIn({required String email, required String password});
}