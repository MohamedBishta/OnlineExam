import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/core/reusable_components/custom_button.dart';
import 'package:online_exam/core/reusable_components/custom_circular_indicator.dart';
import 'package:online_exam/core/reusable_components/custom_err_icon.dart';
import 'package:online_exam/core/reusable_components/custom_form_field.dart';
import 'package:online_exam/core/utils/assets_manager.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/font_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/core/utils/snackbar_utils.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:online_exam/presentation/home/tabs/profile/cubit/profile_cubit.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  var viewModel = getIt.get<ProfileCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.processIntent(GetProfileIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ProfileErr) {
            SnackBarUtils.showSnackBar(context: context, text: state.errMsg);
          }
        },
        builder: (context, state) {
          if (state is ProfileSuccess ||
              SharedPreferencesManager.getUser(StringsManager.user) != null) {
            return Padding(
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
                        backgroundImage: AssetImage(AssetsManager.profile),
                        radius: 40.r,
                      ),
                    ],
                  ),
                  CustomFormField(
                    enable: false,
                    title: StringsManager.userNameTitle,
                    hintText: StringsManager.userNameHint,
                    controller: viewModel.usernameController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          enable: false,
                          title: StringsManager.firstNameTitle,
                          hintText: StringsManager.firstNameHint,
                          controller: viewModel.firstNameController,
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
                          controller: viewModel.lastNameController,
                        ),
                      ),
                    ],
                  ),
                  CustomFormField(
                    enable: false,
                    title: StringsManager.emailTitle,
                    hintText: StringsManager.emailHint,
                    controller: viewModel.emailController,
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomFormField(
                        enable: false,
                        title: StringsManager.passwordTitle,
                        hintText: StringsManager.passwordHint,
                        controller: viewModel.passwordController,
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
                                        fontWeight:
                                            FontWeightManager.semiBold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomFormField(
                    enable: false,
                    title: StringsManager.phoneTitle,
                    hintText: StringsManager.phoneHint,
                    controller: viewModel.phoneController,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              backgroundColor: ColorsManager.grayColor,
                              title: StringsManager.update,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RoutesManager.editeProfileRoteName,
                                    arguments: viewModel);
                              })),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            );
          } else if (state is ProfileErr &&
              SharedPreferencesManager.getUser(StringsManager.user) == null) {
            return CustomErrIcon();
          } else {
            return CustomCircularIndicator();
          }
        },
      ),
    );
  }
}
