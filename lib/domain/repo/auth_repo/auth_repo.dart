import 'package:online_exam/domain/common/result.dart';
import '../../../data/models/Auth/AuthResponse.dart';

abstract class AuthRepo{
  Future<Result<AuthResponse>> SingUp({required String userName, required String firstName, required String lastName, required String email, required String password, required String confirmPassword, required String phone});
  Future<Result<AuthResponse>> SingIn({required String email, required String password});
}