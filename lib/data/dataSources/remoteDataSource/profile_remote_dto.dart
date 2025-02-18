import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/data/models/get_profile_dto.dart';

import '../../../core/utils/result.dart';

abstract class ProfileRemoteDto {
  Future<Result<GetProfileDto>> getProfile();
  Future<Result<EditeProfileResponseModel>> editeProfile(
      EditeProfileInputModel editeProfileInputModel);
}
