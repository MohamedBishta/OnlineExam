import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/forget/verification_code.dart';

import '../../config/theme/di/di.dart';
import '../../core/constants.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';
import 'cubit/foget_password_cubit.dart';
import 'cubit/forget_password_state.dart';

class ResetPassword extends StatefulWidget {
  var email;
  ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocConsumer<HomeViewModel, ForgetPasswordState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: false),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 30.0,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20.sp,
                            ),
                          ),
                          Text(StringsManager.passwordTitle,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(StringsManager.resetPasswordTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 18.sp)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(StringsManager.resetPasswordText,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 14.sp))
                        ],
                      ),
                      CustomFormField(
                        title: StringsManager.newPasswordTitle,
                        hintText: StringsManager.passwordHint,
                        controller: passwordController,
                        validation: (password) {
                          if (password == null || password.trim().isEmpty) {
                            return StringsManager.thisPassIsNotValid;
                          } else if (password.length < 7) {
                            return StringsManager.thisPassIsNotValid;
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: StringsManager.confirmPasswordTitle,
                        hintText: StringsManager.confirmPasswordHint,
                        controller: confirmPasswordController,
                        validation: (password) {
                          if (password == null || password.trim().isEmpty) {
                            return StringsManager.thisPassIsNotValid;
                          } else if (password.length < 7) {
                            return StringsManager.thisPassIsNotValid;
                          }
                          return null;
                        },
                      ),
                      CustomButton(
                        title: StringsManager.continueButton,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (confirmPasswordController.text ==
                                passwordController.text) {
                              homeViewModel.onIntent(NewPasswordIntent(
                                  widget.email,
                                  confirmPasswordController.text));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('check your password again'),
                                    backgroundColor: Colors.red),
                              );
                            }
                          }
                          return;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.pop(context);
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Lottie.asset(
                  'assets/animation/success.json',
                  height: 10.sp,
                  width: 20.sp,
                  //fit: BoxFit.contain,
                );
              },
            );
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          } else if (state is ForgetPasswordFailure) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return Lottie.asset(
                  'assets/animation/fail.json',
                );
              },
            );
          } else if (state is ForgetPasswordLoading) {
            showDialog(
              barrierDismissible: false,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                );
              },
            );
          }
        },
      ),
    );
  }
}
