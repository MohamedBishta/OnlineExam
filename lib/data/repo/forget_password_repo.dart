import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';

import '../../domain/repo/forget_password_repo.dart';
import '../dataSources/remoteDataSource/forget_password_datasource.dart';


@Injectable(as:ForgetPasswordRepo)
 class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
   ForgetPasswordOnlineDataSource forgetPasswordOnlineDataSource;

   ForgetPasswordRepoImpl(this.forgetPasswordOnlineDataSource);

@override
  Future<Result<String?>> forgetPassword(String email) {
    // TODO: implement forgetPassword
    return forgetPasswordOnlineDataSource.forgetPassword(email);
  }


}