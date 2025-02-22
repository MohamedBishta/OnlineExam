import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';

import 'package:online_exam/domain/common/result.dart';

import '../../../../core/api/end_points.dart';
import '../../../models/Auth/AuthResponse.dart';
import '../../datasource_contract/auth_datasource/auth_datasource.dart';
@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource{
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result<AuthResponse>> SingUp ({required String userName, required String firstName, required String lastName, required String email, required String password, required String confirmPassword, required String phone}) async {
    try{
      var response =  await apiManager.postRequest(endpoint: EndPoints.signUpEndpoint,body: {
        "username":userName,
        "firstName":firstName,
        "lastName":lastName,
        "email": email,
        "password":password,
        "rePassword":confirmPassword,
        "phone":phone
      });
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(authResponse.code != null){
        return Error(authResponse.code.toString()??"");
      }else{
        return Success(authResponse);
      }
    }catch(error){
      return Error(error.toString());
    }
  }

  @override
  Future<Result<AuthResponse>> SignIn({required String email, required String password}) async {
    try{
      var response =  await apiManager.postRequest(endpoint: EndPoints.loginUpEndpoint,body: {
        "email": email,
        "password":password,
      });
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(authResponse.code != null){
        return Error(authResponse.code.toString()??"");
      }else{
        return Success(authResponse);
      }
    }on Exception catch(error){
      return Error(error.toString());
    }
  }
  
}