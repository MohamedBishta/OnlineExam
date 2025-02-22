
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/auth_entity.dart';

import '../../../../domain/common/result.dart';
import '../../../../domain/useCases/signin_usecase.dart';
@injectable
class LoginViewModel extends Cubit<LoginStates> {
  @factoryMethod
  LoginViewModel(this.signInUseCase) :super(LoginInitialState());
  SigninUsecase signInUseCase;

  static LoginViewModel get(BuildContext context) => BlocProvider.of(context);

  SignIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await signInUseCase.call(email: email, password: password);
    switch (result) {
      case Success():
        {
          emit(LoginSuccessState(result.data));
        }
      case Error():
        {
          emit(LoginErrorState(result.exception!));
        }
    }
  }
}

sealed class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  AuthEntity authEntity;
  LoginSuccessState(this.authEntity);
}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState(this.error);
}