import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/constants.dart';
import 'package:online_exam/core/utils/strings_manager.dart';

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
      body: Padding(
        padding: REdgeInsets.all(16),
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
              controller: emailController,
              validation: (email) {
                (email) {
                  if (email == null ||
                      email.trim().isEmpty ||
                      email != Constants.emailRegex.hasMatch(email)) {
                    return StringsManager.thisEmailIsNotValid;
                  }
                };
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomFormField(
              title: StringsManager.passwordTitle,
              hintText: StringsManager.passwordHint,
              controller: passController,
              validation: (email) {
                (pass) {
                  if (pass == null || pass.trim().isEmpty || pass < 8) {
                    return StringsManager.thisPassIsNotValid;
                  }
                };
              },
              icon: Icons.visibility_off,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  semanticLabel: StringsManager.rememberMe,
                ),
                Text(StringsManager.forgotPass)
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              title: StringsManager.login,
              onPressed: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(StringsManager.dontHaveAccount)
          ],
        ),
      ),
    );
  }
}
