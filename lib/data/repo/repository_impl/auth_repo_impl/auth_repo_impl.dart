import 'package:injectable/injectable.dart';
import '../../../../core/utils/result.dart';
import '../../../../domain/repo/auth_repo/auth_repo.dart';
import '../../../dataSources/datasource_contract/auth_datasource/auth_datasource.dart';
import '../../../models/Auth/AuthResponse.dart';
import '../../../models/signup_input_model/SignUpModel.dart';


@Injectable(as : AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthDataSource apiDataSource;

  @factoryMethod
  AuthRepoImpl(this.apiDataSource);

  @override
  Future<Result<AuthResponse>> SingUp(SignUpModel signupModel) async {
    var result = await apiDataSource.SingUp(signupModel);
    switch (result) {
      case Success():
        {
          return result;
        }
      case Err():
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
      case Err():
        {
          return result;
        }
    }
  }
}
