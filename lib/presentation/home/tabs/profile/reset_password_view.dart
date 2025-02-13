import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/core/utils/validators.dart';

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
    return Scaffold(
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
      body: Column(
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
                        title: StringsManager.update, onPressed: () {})),
              ],
            ),
          )
        ],
      ),
    );
  }
}
