import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/presentation/forget/forget_password.dart';
import 'package:online_exam/presentation/forget/reset_password.dart';
import 'package:online_exam/presentation/forget/verification_code.dart';
import 'package:online_exam/presentation/home/home_screen.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/exam.dart';
import 'package:online_exam/presentation/home/tabs/explore/exam/exam_score.dart';
import 'package:online_exam/presentation/home/tabs/profile/edite_profile_tap.dart';
import 'package:online_exam/presentation/home/tabs/profile/reset_password_view.dart'
    show ResetPasswordView;
import 'package:online_exam/presentation/login/login_screen.dart';
import 'package:online_exam/presentation/register/register_screen.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/routing/routes_manager.dart';
import 'core/utils/shared_prefrence_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // I
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferencesManager.initialize();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')], // Supported locales
      path: 'assets/translations', // Path to translations folder
      fallbackLocale: const Locale('en'), // Fallback locale
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        initialRoute: RoutesManager.examRouteName,
        routes: {
          RoutesManager.loginRouteName: (_) => LoginScreen(),
          RoutesManager.registerRoteName: (_) => RegisterScreen(),
          RoutesManager.homeRoteName: (_) => HomeScreen(),
          RoutesManager.editeProfileRoteName: (_) => EditeProfileTab(),
          RoutesManager.resetPasswordRoteName: (_) => ResetPasswordView(),
          RoutesManager.forgetRouteName: (_) => ForgetPassword(),
          RoutesManager.otpRouteName: (_) => EmailVerification(),
          RoutesManager.changePasswordRouteName: (_) => ResetPassword(),
          RoutesManager.examRouteName: (_) => ExamScreen(),
          RoutesManager.examScoreRouteName: (_) => ExamScoreScreen()
        },
      ),
    );
  }
}
