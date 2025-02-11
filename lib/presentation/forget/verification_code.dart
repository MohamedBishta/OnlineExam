import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/forget/reset_password.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../core/constants.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        style: Theme.of(context).textTheme.headlineMedium),
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
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 80,
                    style: TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onChanged: (value) {
                      if (value == null || value.length != value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Please enter a valid $value-digit OTP")),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("OTP Verified: $value")),
                      );
                    },
                    onCompleted: (pin) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ));
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16.sp, color: ColorsManager.headTheme)),
                    Text(StringsManager.otpResendText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
  }
}
