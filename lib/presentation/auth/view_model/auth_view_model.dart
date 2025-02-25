import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import '../../../core/utils/result.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/useCases/signin_usecase.dart';
import '../../../domain/useCases/signup_usecase.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates>{
  @factoryMethod
  AuthViewModel(this.signUpUseCase,this.signInUseCase):super(AuthInitialState());
  SignUpUseCase signUpUseCase;
  SigninUsecase signInUseCase;
  static AuthViewModel get(BuildContext context)=>BlocProvider.of(context);

  SignUp(SignUpModel signupModel) async {
    emit(SignUpLoadingState());
    var result = await signUpUseCase.call(signupModel);
    switch (result) {
      case Success():
        {
          emit(SignUpSuccessState(result.data));
        }
      case Err():
        {
          emit(SignUpErrorState(result.ex));
        }
    }
  }

  SignIn({required String email, required String password}) async {
    emit(LoginLoadingState() );
    var result = await signInUseCase.call(email: email, password: password);
    switch (result) {
      case Success():
        {
          emit(LoginSuccessState(result.data));
        }
      case Err():
        {
          emit(LoginErrorState(result.ex));
        }
    }
  }
}
sealed class AuthStates{}
class AuthInitialState extends AuthStates{}
class SignUpLoadingState extends AuthStates{}
class SignUpSuccessState extends AuthStates{
  AuthEntity authEntity;
  SignUpSuccessState(this.authEntity);
}
class SignUpErrorState extends AuthStates{
  Exception error;
  SignUpErrorState(this.error);
}

class LoginInitialState extends AuthStates{}
class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{
  AuthEntity authEntity;
  LoginSuccessState(this.authEntity);
}
class LoginErrorState extends AuthStates{
  Exception error;
  LoginErrorState(this.error);
}