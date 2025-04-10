import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/data/models/signup_input_model/SignUpModel.dart';
import 'package:online_exam/presentation/auth/view_model/auth_view_model.dart';
import '../../../config/theme/di/di.dart';
import '../../../core/constants.dart';
import '../../../core/reusable_components/custom_button.dart';
import '../../../core/reusable_components/custom_form_field.dart';
import '../../../core/utils/routing/routes_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../view_model/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController userNameController;

  late TextEditingController firstNameController;

  late TextEditingController lastNameController;

  late TextEditingController emailController;

  late TextEditingController passController;

  late TextEditingController confirmPassController;

  late TextEditingController phoneController;

  bool visable = true;
  bool confvisable = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthViewModel>(),
      child: Scaffold(
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
                        StringsManager.signUp,
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomFormField(
                    title: StringsManager.userNameTitle,
                    hintText: StringsManager.userNameHint,
                    controller: userNameController,
                    validation: (user) {
                      if (user == null || user.trim().isEmpty) {
                        return StringsManager.thisUserIsNotValid;
                      }
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          title: StringsManager.firstNameTitle,
                          hintText: StringsManager.firstNameHint,
                          controller: firstNameController,
                          validation: (fname) {
                            if (fname == null || fname.trim().isEmpty) {
                              return StringsManager.firstNameHint;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Expanded(
                        child: CustomFormField(
                          title: StringsManager.lastNameTitle,
                          hintText: StringsManager.lastNameHint,
                          controller: lastNameController,
                          validation: (lname) {
                            if (lname == null || lname.trim().isEmpty) {
                              return StringsManager.lastNameHint;
                            }
                          },
                        ),
                      ),
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
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
                          icon:
                              visable ? Icons.visibility_off : Icons.visibility,
                          onIconTap: () {
                            visable = !visable;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Expanded(
                        child: CustomFormField(
                          title: StringsManager.confirmPasswordTitle,
                          obscure: confvisable,
                          hintText: StringsManager.confirmPasswordHint,
                          controller: confirmPassController,
                          validation: (confpass) {
                            if (confpass == null ||
                                confpass.trim().isEmpty ||
                                confpass != passController.text) {
                              return StringsManager.confPassNotMatch;
                            }
                          },
                          icon: confvisable
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onIconTap: () {
                            confvisable = !confvisable;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomFormField(
                    title: StringsManager.phoneTitle,
                    hintText: StringsManager.phoneHint,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validation: (phone) {
                      if (phone == null || phone.trim().isEmpty) {
                        return StringsManager.phoneHint;
                      }
                    },
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  BlocConsumer<AuthViewModel, AuthStates>(
                    builder: (BuildContext context, state) {
                      if (state is AuthLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      }
                      return CustomButton(
                        title: StringsManager.signUp,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AuthViewModel.get(context).doIntent(SignUpIntent(SignUpModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              username: userNameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              password: passController.text,
                              rePassword: passController.text,
                            )));
                          }
                        },
                      );
                    },
                    listener: (BuildContext context, state) {
                      if (state is AuthErrorState) {
                        Fluttertoast.showToast(
                            msg: state.error.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0.sp);
                      }
                      if (state is AuthSuccessState) {
                        Fluttertoast.showToast(
                            msg: 'Account Created Successfully',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0.sp);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesManager.loginRouteName,
                          (route) => false,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.loginRouteName);
                    },
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          StringsManager.alreadyHaveAccount,
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
      ),
    );
  }
}
