import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo/profile_repo.dart';

@injectable
class GetProfileUsecase {
  final ProfileRepo profileRepo;
  GetProfileUsecase(this.profileRepo);
  call() => profileRepo.getProfile();
}
