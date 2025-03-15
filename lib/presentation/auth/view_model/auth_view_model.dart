import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import 'package:online_exam/presentation/auth/view_model/auth_state.dart';
import '../../../core/utils/result.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/useCases/signin_usecase.dart';
import '../../../domain/useCases/signup_usecase.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates>{
  @factoryMethod
  AuthViewModel(this.signUpUseCase,this.signInUseCase):super(AuthInitialState());
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  static AuthViewModel get(BuildContext context)=>BlocProvider.of(context);
  void doIntent(AuthIntent authIntent){
    switch(authIntent){
      case SignInIntent():
        return _signIn(email: authIntent.email, password: authIntent.password);
      case SignUpIntent():
        return _signUp(authIntent.signUpModel);

    }
  }

  _signUp(SignUpModel signupModel) async {
    emit(AuthLoadingState());
    var result = await signUpUseCase.call(signupModel);
    switch (result) {
      case Success():
        {
          emit(AuthSuccessState(result.data));
        }
      case Err():
        {
          emit(AuthErrorState(result.ex));
        }
    }
  }

  _signIn({required String email, required String password}) async {
    emit(AuthLoadingState());
    var result = await signInUseCase.call(email: email, password: password);
    switch (result) {
      case Success():
        {
          emit(AuthSuccessState(result.data));
        }
      case Err():
        {
          emit(AuthErrorState(result.ex));
        }
    }
  }
}
sealed class AuthIntent{}
class SignInIntent extends AuthIntent{
  String email ;
  String password;
  SignInIntent(this.email,this.password);
}
class SignUpIntent extends AuthIntent{
  SignUpModel signUpModel;
  SignUpIntent(this.signUpModel);
}