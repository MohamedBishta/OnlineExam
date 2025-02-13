import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/core/utils/validators.dart';

class EditeProfileTab extends StatefulWidget {
  const EditeProfileTab({super.key});

  @override
  State<EditeProfileTab> createState() => _EditeProfileTabState();
}

class _EditeProfileTabState extends State<EditeProfileTab> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    StringsManager.editeProfile,
                    style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.headlineMedium),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_test.jpg'),
                    radius: 40.r,
                  ),
                ],
              ),
              CustomFormField(
                title: StringsManager.userNameTitle,
                hintText: StringsManager.userNameHint,
                controller: _usernameController,
                validation: ValidatorsManager.validateUsername,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      title: StringsManager.firstNameTitle,
                      hintText: StringsManager.firstNameHint,
                      controller: _firstNameController,
                      validation: ValidatorsManager.validateFirstName,
                    ),
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Expanded(
                    child: CustomFormField(
                      title: StringsManager.lastNameTitle,
                      hintText: StringsManager.lastNameHint,
                      controller: _lastNameController,
                      validation: ValidatorsManager.validateLastName,
                    ),
                  ),
                ],
              ),
              CustomFormField(
                title: StringsManager.emailTitle,
                hintText: StringsManager.emailHint,
                controller: _emailController,
                validation: ValidatorsManager.validateEmail,
              ),
              CustomFormField(
                title: StringsManager.passwordTitle,
                hintText: StringsManager.passwordHint,
                controller: _passwordController,
                validation: ValidatorsManager.validatePassword,
              ),
              CustomFormField(
                title: StringsManager.phoneTitle,
                hintText: StringsManager.phoneHint,
                controller: _phoneController,
                validation: ValidatorsManager.validatePhone,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          title: StringsManager.update,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Form submitted successfully');
                            }
                          })),
                ],
              ),
              SizedBox(
                height: 70.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
