import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/data/models/get_profile_dto.dart';

import '../../../core/utils/result.dart';
import '../../models/change_password_input_model.dart';
import '../../models/change_password_model.dart';

abstract class ProfileRemoteDto {
  Future<Result<GetProfileDto>> getProfileDto();
  Future<Result<EditeProfileResponseModel>> editeProfileDto(
      EditeProfileInputModel editeProfileInputModel);
  Future<Result<ChangePasswordModel>> changePasswordDto(
      ChangePasswordInputModel changePasswordInputModel);
}
