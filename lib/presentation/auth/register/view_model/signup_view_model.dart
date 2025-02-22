
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/auth_entity.dart';

import '../../../../domain/common/result.dart';
import '../../../../domain/useCases/signup_usecase.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpStates>{
  @factoryMethod
  SignUpViewModel(this.signUpUseCase):super(SignUpInitialState());
  SignUpUseCase signUpUseCase;
  static SignUpViewModel get(BuildContext context)=>BlocProvider.of(context);

  SignUp({required String userName, required String firstName, required String lastName, required String email, required String password, required String confirmPassword, required String phone}) async {
    emit(SignUpLoadingState());
    var result = await signUpUseCase.call(userName: userName, firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword, phone: phone);
    switch (result) {
      case Success():
        {
          emit(SignUpSuccessState(result.data));
        }
      case Error():
        {
          emit(SignUpErrorState(result.exception!));
        }
    }
  }
}
abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
  AuthEntity authEntity;
  SignUpSuccessState(this.authEntity);
}
class SignUpErrorState extends SignUpStates{
  String error;
  SignUpErrorState(this.error);
}