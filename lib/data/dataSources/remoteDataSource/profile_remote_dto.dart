import '../../../core/utils/result.dart';

abstract class ProfileRemoteDto {
  Future<Result> getProfile();
}
