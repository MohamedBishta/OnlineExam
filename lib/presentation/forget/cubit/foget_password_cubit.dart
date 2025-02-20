import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/useCases/new_password_usecase.dart';
import 'package:online_exam/domain/useCases/otp_code_usecase.dart';
import '../../../core/utils/result.dart';
import '../../../domain/useCases/forget_password_usecase.dart';
import 'forget_password_state.dart';

@injectable
class HomeViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  OtpCodeUseCase otpCodeUseCase;
  NewPasswordUseCase newPasswordUseCase;
  HomeViewModel(
      this.forgetPasswordUseCase, this.otpCodeUseCase, this.newPasswordUseCase)
      : super(ForgetPasswordInitial());

  void onIntent(ForgetIntent intent) {
    switch (intent) {
      case ForgotPasswordIntent():
        _handleForgetPassword(intent.email);
        break;
      case OtpCodeIntent():
        _handleOtpCode(intent.code);

      case NewPasswordIntent():
        _handleNewPassword(intent.email, intent.password);
      case LoadHomeIntent():
        _loadHome();
        break;
    }
  }

  Future<void> _handleForgetPassword(String email) async {
    try {
      emit(ForgetPasswordLoading());
      var forgetPasssword = await forgetPasswordUseCase.forgetPassword(email);
      if (forgetPasssword is Err) {
        var error = (forgetPasssword as Err).ex;
        if (error.toString().contains('404')) {
          emit(ForgetPasswordFailure(
              'The email address you entered is not valid. Please check and try again.'));
        } else {
          emit(ForgetPasswordFailure(error.toString()));
        }
      } else if (forgetPasssword is Success) {
        var successMsg = (forgetPasssword as Success).data;
        emit(ForgetPasswordSuccess(successMsg));
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailure('$e'));
    }
  }

  Future<void> _handleOtpCode(String code) async {
    try {
      emit(ForgetPasswordLoading());
      var OtpCode = await otpCodeUseCase.getOtpCode(code);
      if (OtpCode is Err) {
        var error = (OtpCode as Err).ex;
        if (error.toString().contains('400')) {
          emit(ForgetPasswordFailure('Reset code is invalid or has expired'));
        } else {
          emit(ForgetPasswordFailure(error.toString()));
        }
      } else if (OtpCode is Success) {
        var successMsg = (OtpCode as Success).data;
        emit(ForgetPasswordSuccess(successMsg));
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailure('$e'));
    }
  }

  Future<void> _handleNewPassword(String email, String password) async {
    try {
      emit(ForgetPasswordLoading());
      var NewPassword = await newPasswordUseCase.newPassword(email, password);
      if (NewPassword is Err) {
        var error = (NewPassword as Err).ex;
        if (error.toString().contains('400')) {
          emit(ForgetPasswordFailure('reset code not verified'));
        } else {
          emit(ForgetPasswordFailure(error.toString()));
        }
      } else if (NewPassword is Success) {
        var successMsg = (NewPassword as Success).data;
        emit(ForgetPasswordSuccess(successMsg));
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailure('$e'));
    }
  }
}

void _loadHome() {}

sealed class ForgetIntent {}

class ForgotPasswordIntent extends ForgetIntent {
  final String email;
  ForgotPasswordIntent(this.email);
}

class OtpCodeIntent extends ForgetIntent {
  final String code;
  OtpCodeIntent(this.code);
}

class NewPasswordIntent extends ForgetIntent {
  final String email;
  final String password;
  NewPasswordIntent(this.email, this.password);
}

class LoadHomeIntent extends ForgetIntent {}
