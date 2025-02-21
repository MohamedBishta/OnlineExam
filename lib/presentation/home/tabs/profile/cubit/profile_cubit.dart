import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:online_exam/domain/useCases/change_password_usecase.dart';
import 'package:online_exam/domain/useCases/edite_profile_usecase.dart';
import 'package:online_exam/domain/useCases/get_profile_usecase.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getProfileUsecase,
    this._editeProfileUsecase,
    this._changePasswordUsecase,
  ) : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  final GetProfileUsecase _getProfileUsecase;
  final EditeProfileUsecase _editeProfileUsecase;
  final ChangePasswordUsecase _changePasswordUsecase;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
      TextEditingController(text: '********');
  final TextEditingController phoneController = TextEditingController();

  GetProfileEntity? profileData;

  void processIntent(ProfileIntent intent) {
    switch (intent) {
      case GetProfileIntent():
        _getProfileData();
        break;
      case EditeProfileIntent():
        _editeProfileData(intent.editeProfileInputModel);
        break;
      case ChangePasswordIntent():
        _changePassword(intent.changePasswordInputModel);
        break;
    }
  }

  void _getProfileData() async {
    emit(ProfileLoading());
    final response = await _getProfileUsecase.call();
    switch (response) {
      case Success():
        profileData = response.data;
        _updateControllers();
        emit(ProfileSuccess(profileData: profileData));
        break;
      case Err():
        emit(ProfileErr(errMsg: response.ex.toString()));
    }
  }

  void _editeProfileData(EditeProfileInputModel editeProfileInputModel) async {
    emit(ProfileLoading());
    final response = await _editeProfileUsecase.call(editeProfileInputModel);

    switch (response) {
      case Success():
        emit(ProfileSuccess(editeProfileResponseModel: response.data));
        break;
      case Err():
        emit(ProfileErr(errMsg: response.ex.toString()));
    }
  }

  void _changePassword(
      ChangePasswordInputModel changePasswordInputModel) async {
    emit(ProfileLoading());
    final response =
        await _changePasswordUsecase.call(changePasswordInputModel);

    switch (response) {
      case Success():
        emit(ProfileSuccess());
        break;
      case Err():
        emit(ProfileErr(errMsg: response.ex.toString()));
    }
  }

  void _updateControllers() {
    if (profileData != null) {
      usernameController.text = profileData!.user!.username!;
      firstNameController.text = profileData!.user!.firstName!;
      lastNameController.text = profileData!.user!.lastName!;
      emailController.text = profileData!.user!.email!;
      phoneController.text = profileData!.user!.phone!;
    }
  }
}

sealed class ProfileIntent {}

class GetProfileIntent extends ProfileIntent {}

class EditeProfileIntent extends ProfileIntent {
  final EditeProfileInputModel editeProfileInputModel;
  EditeProfileIntent(this.editeProfileInputModel);
}

class ChangePasswordIntent extends ProfileIntent {
  final ChangePasswordInputModel changePasswordInputModel;
  ChangePasswordIntent(this.changePasswordInputModel);
}
