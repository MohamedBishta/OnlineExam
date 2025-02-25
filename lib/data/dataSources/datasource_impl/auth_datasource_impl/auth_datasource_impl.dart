import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/result.dart';
import '../../../models/Auth/AuthResponse.dart';
import '../../datasource_contract/auth_datasource/auth_datasource.dart';
@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource{
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result<AuthResponse>> SingUp (SignUpModel signupModel) async {
    return apiExecutor(() async {
      var response =  await apiManager.post(endPoint: EndPoints.signUpEndpoint,body: signupModel.toJson() );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(response.statusCode == 200){
        return authResponse;
      }else{
        throw Exception(authResponse.message);
      }
    });
  }

  @override
  Future<Result<AuthResponse>> SignIn({required String email, required String password}) async {
    return apiExecutor(() async {
      var response =  await apiManager.post(endPoint: EndPoints.loginEndpoint,body: {
        "email": email,
        "password":password,
      });
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(response.statusCode == 200){
        return authResponse;
      }else{
        throw Exception(authResponse.message);
      }
    });

  }
  
}