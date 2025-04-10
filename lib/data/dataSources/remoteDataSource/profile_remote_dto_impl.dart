import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_executer.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/end_points.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/profile_remote_dto.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';
import 'package:online_exam/data/models/change_password_model.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';

import '../../models/get_profile_dto.dart';

@Injectable(as: ProfileRemoteDto)
class ProfileRemoteDtoImpl implements ProfileRemoteDto {
  final ApiManager apiManager;

  ProfileRemoteDtoImpl(this.apiManager);
  @override
  Future<Result<GetProfileDto>> getProfileDto() async {
    return apiExecutor<GetProfileDto>(() async {
      var response = await apiManager.get(
        endPoint: EndPoints.getProfile,
      );

      if (response.statusCode == 200) {
        return GetProfileDto.fromJson(response.data);
      } else {
        throw Exception(GetProfileDto.fromJson(response.data).message);
      }
    });
  }

  @override
  Future<Result<EditeProfileResponseModel>> editeProfileDto(
      EditeProfileInputModel editeProfileInputModel) async {
    return apiExecutor<EditeProfileResponseModel>(() async {
      var response = await apiManager.put(
        body: editeProfileInputModel.toJson(),
        endPoint: EndPoints.editProfile,
      );
      if (response.statusCode == 200) {
        return EditeProfileResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  @override
  Future<Result<ChangePasswordModel>> changePasswordDto(
      ChangePasswordInputModel changePasswordInputModel) async {
    return apiExecutor<ChangePasswordModel>(() async {
      var response = await apiManager.patch(
        body: changePasswordInputModel.toJson(),
        endPoint: EndPoints.changePassword,
      );
      if (response.statusCode == 200) {
        return ChangePasswordModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message']);
      }
    });
  }
}