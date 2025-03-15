import '../../../domain/entity/auth_entity.dart';

sealed class AuthStates{}
class AuthInitialState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{
  AuthEntity? authEntity;
  AuthSuccessState(this.authEntity);
}
class AuthErrorState extends AuthStates{
  Exception error;
  AuthErrorState(this.error);
}