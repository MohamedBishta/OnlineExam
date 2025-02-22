import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/constants.dart';
import 'package:online_exam/core/utils/routing/routes_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/forget/forget_password.dart';

import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;
  bool checkBoxClick = false;
  bool visable = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                    ),
                    Text(
                      StringsManager.login,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomFormField(
                  title: StringsManager.emailTitle,
                  hintText: StringsManager.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validation: (email) {
                    if (email == null ||
                        email.trim().isEmpty ||
                        !Constants.emailRegex.hasMatch(email)) {
                      return StringsManager.thisEmailIsNotValid;
                    }
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomFormField(
                  title: StringsManager.passwordTitle,
                  obscure: visable,
                  hintText: StringsManager.passwordHint,
                  controller: passController,
                  validation: (pass) {
                    if (pass == null || pass.trim().isEmpty) {
                      return StringsManager.thisPassIsNotValid;
                    }
                    if (pass.length < 6) {
                      return StringsManager.thisPassIsWeak;
                    }
                  },
                  icon: visable ? Icons.visibility_off : Icons.visibility,
                  onIconTap: () {
                    visable = !visable;
                    setState(() {});
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxClick,
                      onChanged: (value) {
                        checkBoxClick = value!;
                        setState(() {});
                      },
                      semanticLabel: StringsManager.rememberMe,
                    ),
                    Text(
                      StringsManager.rememberMe,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 13.sp),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {},
                        child: Text(StringsManager.forgotPass,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    decoration: TextDecoration.underline)))
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                CustomButton(
                  title: StringsManager.login,
                  onPressed: () {
                    if (formKey.currentState?.validate() == false) {
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.registerRoteName);
                  },
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        StringsManager.dontHaveAccount,
                        style: TextStyle(
                            decorationColor: Colors.blue,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
