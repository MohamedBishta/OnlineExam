import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../../../core/utils/result.dart';
import '../../../models/Auth/AuthResponse.dart';

abstract class AuthDataSource{
  Future<Result<AuthResponse>> singUp(SignUpModel signupModel);

  Future<Result<AuthResponse>> signIn({required String email,required String password});
}
