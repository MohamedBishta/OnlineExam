import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/font_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/strings_manager.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose all controllers
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.profile,
              style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headlineMedium),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile_test.jpg'),
                  radius: 40.r,
                ),
              ],
            ),
            CustomFormField(
              enable: false,
              title: StringsManager.userNameTitle,
              hintText: StringsManager.userNameHint,
              controller: _usernameController,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    enable: false,
                    title: StringsManager.firstNameTitle,
                    hintText: StringsManager.firstNameHint,
                    controller: _firstNameController,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Expanded(
                  child: CustomFormField(
                    enable: false,
                    title: StringsManager.lastNameTitle,
                    hintText: StringsManager.lastNameHint,
                    controller: _lastNameController,
                  ),
                ),
              ],
            ),
            CustomFormField(
              enable: false,
              title: StringsManager.emailTitle,
              hintText: StringsManager.emailHint,
              controller: _emailController,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CustomFormField(
                  enable: false,
                  title: StringsManager.passwordTitle,
                  hintText: StringsManager.passwordHint,
                  controller: _passwordController,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesManager.resetPasswordRoteName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: Text(
                      StringsManager.change,
                      style: GoogleFonts.inter(
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorsManager.primaryColor,
                                  fontWeight: FontWeightManager.semiBold)),
                    ),
                  ),
                ),
              ],
            ),
            CustomFormField(
              enable: false,
              title: StringsManager.phoneTitle,
              hintText: StringsManager.phoneHint,
              controller: _phoneController,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        backgroundColor: ColorsManager.grayColor,
                        title: StringsManager.update,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesManager.editeProfileRoteName);
                        })),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
