import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';
import 'package:online_exam/domain/repo/profile_repo.dart';

@injectable
class ChangePasswordUsecase {
  final ProfileRepo profileRepo;
  ChangePasswordUsecase(this.profileRepo);
  call(ChangePasswordInputModel changePasswordInputModel) =>
      profileRepo.changePassword(changePasswordInputModel);
}
