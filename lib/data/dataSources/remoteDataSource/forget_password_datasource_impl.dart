import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';
import 'package:online_exam/core/utils/result.dart';

import 'forget_password_datasource.dart';

@Injectable(as: ForgetPasswordOnlineDataSource)
class ForgetPasswordOnlineDataSourceImpl
    implements ForgetPasswordOnlineDataSource {
  ApiManager apiClient;
  ForgetPasswordOnlineDataSourceImpl(this.apiClient);
  @override
  Future<Result<String>> forgetPassword(String email) async {
    return apiExecutor<String>(() async {
        final data = {
          'email': email,
        };
        var response = await apiClient.post(
          endPoint: EndPoints.forgetPasswordEmailVerification,
          body: data,
        );
        if(response.statusCode==200){
          return jsonEncode(response.data['status']);
        }else{
          throw Exception(jsonEncode(response.data["code"]));
        }

      },

    );

  }
}
