import 'package:injectable/injectable.dart';
import '../../core/utils/result.dart';
import '../entity/auth_entity.dart';
import '../repo/auth_repo/auth_repo.dart';

@injectable
class SignInUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUseCase(this.authRepo);
  Future<Result<AuthEntity>> call({required String email, required String password})=> authRepo.singIn(email: email, password: password);
}