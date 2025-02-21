import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/core/utils/snackbar_utils.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/data/models/edite_profile_input_model.dart';
import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:online_exam/presentation/home/tabs/profile/cubit/profile_cubit.dart';

import '../../../../core/reusable_components/custom_circular_indicator.dart';

class EditeProfileTab extends StatefulWidget {
  const EditeProfileTab({super.key});

  @override
  State<EditeProfileTab> createState() => _EditeProfileTabState();
}

class _EditeProfileTabState extends State<EditeProfileTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserEntity profileData =
      SharedPreferencesManager.getUser(StringsManager.user)!;
  @override
  Widget build(BuildContext context) {
    var viewModel = ModalRoute.of(context)!.settings.arguments as ProfileCubit;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<ProfileCubit, ProfileState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ProfileSuccess) {
            SharedPreferencesManager.updateUser(
                key: StringsManager.user, user: profileData);
            SnackBarUtils.showSnackBar(
                context: context,
                text: StringsManager.profileUpdatedSuccessfully);
            Navigator.popUntil(context, (route) => route.isFirst);
            // Navigator.pushReplacementNamed(context, RoutesManager.homeRoteName)
          } else if (state is ProfileErr) {
            SnackBarUtils.showSnackBar(context: context, text: state.errMsg);
          } else if (state is ProfileLoading) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const CustomLoadingIndicator();
                });
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      StringsManager.editeProfile,
                      style: GoogleFonts.inter(
                          textStyle:
                              Theme.of(context).textTheme.headlineMedium),
                    ),
                  ],
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetsManager.profile),
                      radius: 40.r,
                    ),
                  ],
                ),*/
                CustomFormField(
                  title: StringsManager.userNameTitle,
                  hintText: StringsManager.userNameHint,
                  controller: viewModel.usernameController,
                  validation: ValidatorsManager.validateUsername,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        title: StringsManager.firstNameTitle,
                        hintText: StringsManager.firstNameHint,
                        controller: viewModel.firstNameController,
                        validation: ValidatorsManager.validateFirstName,
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Expanded(
                      child: CustomFormField(
                        title: StringsManager.lastNameTitle,
                        hintText: StringsManager.lastNameHint,
                        controller: viewModel.lastNameController,
                        validation: ValidatorsManager.validateLastName,
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  title: StringsManager.emailTitle,
                  hintText: StringsManager.emailHint,
                  controller: viewModel.emailController,
                  validation: ValidatorsManager.validateEmail,
                ),
                CustomFormField(
                  title: StringsManager.phoneTitle,
                  hintText: StringsManager.phoneHint,
                  controller: viewModel.phoneController,
                  validation: ValidatorsManager.validatePhone,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            title: StringsManager.update,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                profileData = EditeProfileInputModel(
                                  firstName: viewModel.firstNameController.text,
                                  email: viewModel.emailController.text,
                                  lastName: viewModel.lastNameController.text,
                                  phone: viewModel.phoneController.text,
                                  username: viewModel.usernameController.text,
                                );
                                viewModel.processIntent(EditeProfileIntent(
                                    profileData as EditeProfileInputModel));
                              }

                              // Navigator.pop(context);
                            })),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
