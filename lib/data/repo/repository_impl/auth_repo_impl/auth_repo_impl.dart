import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/auth_entity.dart';
import '../../../../core/utils/result.dart';
import '../../../../domain/repo/auth_repo/auth_repo.dart';
import '../../../dataSources/datasource_contract/auth_datasource/auth_datasource.dart';
import '../../../models/signup_input_model/SignUpModel.dart';


@Injectable(as : AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthDataSource apiDataSource;

  @factoryMethod
  AuthRepoImpl(this.apiDataSource);

  @override
  Future<Result<AuthEntity>> singUp(SignUpModel signupModel) async {
    var result = await apiDataSource.singUp(signupModel);
    switch (result) {
      case Success():
        {
          return Success(result.data?.toAuthEntity());
        }
      case Err():
        {
          return Err(ex: result.ex);
        }
    }
  }

  @override
  Future<Result<AuthEntity>> singIn({required String email, required String password}) async {
    var result = await apiDataSource.signIn(email: email, password: password);
    switch (result) {
      case Success():
        {
          return Success(result.data?.toAuthEntity());
        }
      case Err():
        {
          return Err(ex: result.ex);
        }
    }
  }
}
