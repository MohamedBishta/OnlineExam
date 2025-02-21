import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/data/models/change_password_input_model.dart';

import '../../../../core/reusable_components/custom_circular_indicator.dart';
import '../../../../core/utils/snackbar_utils.dart';
import 'cubit/profile_cubit.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var viewModel = getIt.get<ProfileCubit>();
  @override
  void dispose() {
    // Dispose all controllers
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ProfileSuccess) {
            Navigator.popUntil(context, (route) => route.isFirst);
            SnackBarUtils.showSnackBar(
                context: context,
                text: StringsManager.passwordChangedSuccessfully);
          } else if (state is ProfileErr) {
            SnackBarUtils.showSnackBar(context: context, text: state.errMsg);
            Navigator.pop(context);
          } else if (state is ProfileLoading) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const CustomLoadingIndicator();
                });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              StringsManager.resetPassword,
              style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headlineMedium),
            ),
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios)),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: CustomFormField(
                    title: StringsManager.currentPasswordTitle,
                    hintText: StringsManager.currentPasswordHint,
                    controller: _currentPasswordController,
                    validation: ValidatorsManager.validatePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: CustomFormField(
                    title: StringsManager.newPasswordTitle,
                    hintText: StringsManager.newPasswordHint,
                    controller: _newPasswordController,
                    validation: ValidatorsManager.validatePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: CustomFormField(
                    title: StringsManager.confirmPasswordTitle,
                    hintText: StringsManager.confirmPasswordHint,
                    controller: _confirmPasswordController,
                    validation: ValidatorsManager.validatePassword,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: StringsManager.update,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              viewModel.processIntent(
                                ChangePasswordIntent(
                                  ChangePasswordInputModel(
                                      oldPassword:
                                          _currentPasswordController.text,
                                      password: _newPasswordController.text,
                                      rePassword:
                                          _confirmPasswordController.text),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
