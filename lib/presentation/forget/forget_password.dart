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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocConsumer<HomeViewModel, ForgetPasswordState>(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmailVerification(
                      email: emailController.text,
                    )),
              );
            });
          } else if (state is ForgetPasswordFailure) {
            Navigator.pop(context);
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return Lottie.asset(
                  'assets/animation/fail.json',
                  backgroundLoading: true,
                  height: 10.0,
                  width: 20.0,
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
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                          ),
                          Text(
                            StringsManager.passwordTitle,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Text(
                          StringsManager.forgetPasswordTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          StringsManager.forgetPasswordText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        title: StringsManager.emailTitle,
                        hintText: StringsManager.emailHint,
                        controller: emailController,
                        validation: (email) {
                          if (email == null || email.trim().isEmpty) {
                            return StringsManager.thisEmailIsNotValid;
                          } else if (!Constants.emailRegex.hasMatch(email)) {
                            return StringsManager.thisEmailIsNotValid;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        title: StringsManager.continueButton,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            homeViewModel.onIntent(ForgotPasswordIntent(
                                emailController.text.trim()));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
