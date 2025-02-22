import 'package:online_exam/domain/common/result.dart';

import '../../../models/Auth/AuthResponse.dart';

abstract class AuthDataSource{
  Future<Result<AuthResponse>> SingUp({required String userName,required String firstName,required String lastName,required String email,required String password,
  required String confirmPassword,required String phone});

  Future<Result<AuthResponse>> SignIn({required String email,required String password});
}
