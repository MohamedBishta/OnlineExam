import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/otp_code_datasource.dart';
import '../../../core/utils/result.dart';

@Injectable(as: OtpCodeDataOnlineSource)
class OtpCodeDataOnlineSourceImpl implements OtpCodeDataOnlineSource {
  ApiManager apiClient;
  OtpCodeDataOnlineSourceImpl(this.apiClient);

  @override
  Future<Result<String>> getOtpCode(String code) {
    return apiExecutor(
      () async {
        final data = {
          'resetCode': code,
        };
        var response =
            await apiClient.post(endPoint: EndPoints.resetCode, body: data);
        if (response.statusCode == 200) {
          return jsonEncode(response.data['message']);
        } else {
          throw Exception(jsonEncode(response.data["code"]));
        }
      },
    );
  }
}
