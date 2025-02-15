import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/profile_remote_dto.dart';
import 'package:online_exam/data/models/get_profile_dto.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:online_exam/domain/repo/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDto _profileRemoteDto;

  ProfileRepoImpl(this._profileRemoteDto);
  @override
  Future<Result<GetProfileEntity>> getProfile() async {
    var response = await _profileRemoteDto.getProfile();

    switch (response) {
      case Success():
        {
          return Success<GetProfileEntity>(response.data);
        }
      case Err():
        {
          return Err(ex: response.ex);
        }
    }
  }
}
