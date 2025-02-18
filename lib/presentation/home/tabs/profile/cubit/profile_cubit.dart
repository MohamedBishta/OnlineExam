import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/data/models/edite_profile_response_model.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:online_exam/domain/useCases/edite_profile_usecase.dart';
import 'package:online_exam/domain/useCases/get_profile_usecase.dart';

import '../../../../../core/utils/shared_prefrence_manager.dart';
import '../../../../../core/utils/strings_manager.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfileUsecase, this._editeProfileUsecase)
      : super(ProfileInitial());
  static get(context) => BlocProvider.of<ProfileCubit>(context);
  final GetProfileUsecase _getProfileUsecase;
  final EditeProfileUsecase _editeProfileUsecase;
  final TextEditingController usernameController = TextEditingController(
    text: SharedPreferencesManager.getUser(StringsManager.user)!.username,
  );
  final TextEditingController firstNameController = TextEditingController(
    text: SharedPreferencesManager.getUser(StringsManager.user)!.firstName,
  );
  final TextEditingController lastNameController = TextEditingController(
    text: SharedPreferencesManager.getUser(StringsManager.user)!.lastName,
  );
  final TextEditingController emailController = TextEditingController(
    text: SharedPreferencesManager.getUser(StringsManager.user)!.email,
  );
  final TextEditingController passwordController =
      TextEditingController(text: '********');
  final TextEditingController phoneController = TextEditingController(
    text: SharedPreferencesManager.getUser(StringsManager.user)!.phone,
  );
  static GetProfileEntity? profileDate;
  getProfileData() async {
    emit(ProfileLoading());
    var response = await _getProfileUsecase.call();

    switch (response) {
      case Success():
        {
          profileDate = response.data;

          emit(ProfileSuccess(profileData: profileDate));
        }
      case Err():
        {
          emit(ProfileErr(errMsg: response.ex.toString()));
        }
    }
  }

  editeProfileData(EditeProfileInputModel editeProfileInputModel) async {
    emit(ProfileLoading());
    var response = await _editeProfileUsecase.call(editeProfileInputModel);

    switch (response) {
      case Success():
        {
          emit(ProfileSuccess(editeProfileResponseModel: response.data));
        }
      case Err():
        {
          emit(ProfileErr(errMsg: response.ex.toString()));
        }
    }
  }
}
