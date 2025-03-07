import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/profile_remote_dto.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:online_exam/domain/repo/profile_repo.dart';

import '../models/change_password_model.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDto _profileRemoteDto;

  ProfileRepoImpl(this._profileRemoteDto);
  @override
  Future<Result<GetProfileEntity>> getProfile() async {
    var response = await _profileRemoteDto.getProfileDto();

    switch (response) {
      case Success():
        {
          SharedPreferencesManager.saveUser(
              user: response.data!.user!, key: StringsManager.user);
          return Success<GetProfileEntity>(response.data);
        }
      case Err():
        {
          return Err<GetProfileEntity>(ex: response.ex);
        }
    }
  }

  @override
  Future<Result<EditeProfileResponseModel>> editeProfile(
      EditeProfileInputModel editeProfileInputModel) async {
    var response =
        await _profileRemoteDto.editeProfileDto(editeProfileInputModel);

    switch (response) {
      case Success():
        {
          return Success<EditeProfileResponseModel>(response.data);
        }
      case Err():
        {
          return Err<EditeProfileResponseModel>(ex: response.ex);
        }
    }
  }

  @override
  Future<Result<ChangePasswordModel>> changePassword(
      ChangePasswordInputModel changePasswordInputModel) async {
    var response =
        await _profileRemoteDto.changePasswordDto(changePasswordInputModel);
    switch (response) {
      case Success<ChangePasswordModel>():
        {
          return Success<ChangePasswordModel>(response.data);
        }
      case Err<ChangePasswordModel>():
        {
          return Err<ChangePasswordModel>(ex: response.ex);
        }
    }
  }
}
