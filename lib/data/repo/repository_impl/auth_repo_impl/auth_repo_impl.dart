import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';

import '../../../../domain/repo/auth_repo/auth_repo.dart';
import '../../../dataSources/datasource_contract/auth_datasource/auth_datasource.dart';
import '../../../models/Auth/AuthResponse.dart';


@Injectable(as : AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthDataSource apiDataSource;

  @factoryMethod
  AuthRepoImpl(this.apiDataSource);

  @override
  Future<Result<AuthResponse>> SingUp(
      {required String userName, required String firstName, required String lastName, required String email, required String password, required String confirmPassword, required String phone}) async {
    var result = await apiDataSource.SingUp(userName: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone);
    switch (result) {
      case Success():
        {
          return result;
        }
      case Error():
        {
          return result;
        }
    }
  }

  @override
  Future<Result<AuthResponse>> SingIn(
      {required String email, required String password}) async {
    var result = await apiDataSource.SignIn(email: email, password: password);
    switch (result) {
      case Success():
        {
          return result;
        }
      case Error():
        {
          return result;
        }
    }
  }
}
