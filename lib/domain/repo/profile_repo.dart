import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';

import '../../data/models/change_password_model.dart';

abstract class ProfileRepo {
  Future<Result<GetProfileEntity>> getProfile();
  Future<Result<EditeProfileResponseModel>> editeProfile(
      EditeProfileInputModel editeProfileInputModel);
  Future<Result<ChangePasswordModel>> changePassword(
      ChangePasswordInputModel changePasswordInputModel);
}
