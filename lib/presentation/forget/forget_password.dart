import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/forget/verification_code.dart';

import '../../core/constants.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                    Text(StringsManager.forgetPasswordTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18.sp)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(StringsManager.forgetPasswordText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 14.sp))
                  ],
                ),
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
                CustomButton(
                  title: StringsManager.continueButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     Navigator.push(context,MaterialPageRoute(builder: (context) => EmailVerification(),));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
