import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/profile_remote_dto.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';

import '../../models/get_profile_dto.dart';

@Injectable(as: ProfileRemoteDto)
class ProfileRemoteDtoImpl extends ProfileRemoteDto {
  final ApiManager apiManager;

  ProfileRemoteDtoImpl(this.apiManager);
  @override
  Future<Result<GetProfileDto>> getProfile() async {
    return apiExecutor<GetProfileDto>(() async {
      var response =
          await apiManager.get(endPoint: EndPoints.getProfile, headers: {
        'token': StringsManager.token,
      });
      return GetProfileDto.fromJson(response.data);
    });
  }

  @override
  Future<Result<EditeProfileResponseModel>> editeProfile(
      EditeProfileInputModel editeProfileInputModel) async {
    return apiExecutor<EditeProfileResponseModel>(() async {
      var response = await apiManager.put(
          body: editeProfileInputModel.toJson(),
          endPoint: EndPoints.editProfile,
          headers: {
            'token': StringsManager.token,
          });
      return EditeProfileResponseModel.fromJson(response.data);
    });
  }
}
