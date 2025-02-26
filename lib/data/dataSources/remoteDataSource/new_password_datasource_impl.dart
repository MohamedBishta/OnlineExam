import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';

import '../../../core/utils/result.dart';
import 'new_password_datasource.dart';

@Injectable(as: NewPasswordDataOnlineSource)
class NewPasswordDataOnlineSourceImpl implements NewPasswordDataOnlineSource {
  ApiManager apiClient;
  NewPasswordDataOnlineSourceImpl(this.apiClient);
  @override
  Future<Result<String>> newPassword(String email, String password) {
    return apiExecutor(
      () async {
        final data = {'email': email, 'newPassword': password};
        var response = await apiClient.put(endPoint: EndPoints.resetPassword, body: data);
        print('Response:$response');
        if (response.statusCode == 200) {
          return response.data['message'];
        } else {
          throw Exception(response.data["code"]);
        }
      },
    );
  }
}
