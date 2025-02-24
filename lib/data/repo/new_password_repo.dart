import 'package:injectable/injectable.dart';
import 'package:online_exam/data/dataSources/remoteDataSource/new_password_datasource.dart';
import 'package:online_exam/domain/repo/new_password_repo.dart';
import '../../core/utils/result.dart';
@Injectable(as:NewPasswordRepo)
class NewPasswordRepoImpl implements NewPasswordRepo {
  NewPasswordDataOnlineSource newPasswordDataOnlineSource;
  NewPasswordRepoImpl(this.newPasswordDataOnlineSource);

  @override
  Future<Result<String>> newPassword(String email, String password) {
    // TODO: implement newPassword
    return newPasswordDataOnlineSource.newPassword(email, password);
  }
}
