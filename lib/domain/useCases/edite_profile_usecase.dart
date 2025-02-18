import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/domain/repo/profile_repo.dart';

@injectable
class EditeProfileUsecase {
  final ProfileRepo profileRepo;
  EditeProfileUsecase(this.profileRepo);
  call(EditeProfileInputModel editeProfileInputModel) =>
      profileRepo.editeProfile(editeProfileInputModel);
}
