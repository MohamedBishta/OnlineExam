import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/forget/cubit/forget_password_state.dart';
import 'package:online_exam/presentation/forget/reset_password.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../config/theme/di/di.dart';
import '../../core/constants.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';
import 'cubit/foget_password_cubit.dart';

class EmailVerification extends StatefulWidget {
  var email;
   EmailVerification({super.key,this.email});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                          Text(StringsManager.emailVerificationTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 18.sp)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(StringsManager.emailVerificationText,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 14.sp))
                        ],
                      ),
                      Center(
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 50,
                          style: TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            homeViewModel.onIntent(OtpCodeIntent(pin));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(StringsManager.otpSendText,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                      color: ColorsManager.headTheme)),
                          Text(StringsManager.otpResendText,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 16.sp,
                                      color: ColorsManager.babyBlue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: ColorsManager.babyBlue))
                        ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPassword(email:widget.email,)),
              );
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
