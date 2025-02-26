import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/get_profile_dto.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';

abstract class ProfileRepo {
  Future<Result<GetProfileEntity>> getProfile();
}
