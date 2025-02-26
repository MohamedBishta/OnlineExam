import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/presentation/forget/forget_password.dart';
import 'package:online_exam/presentation/forget/reset_password.dart';
import 'package:online_exam/presentation/forget/verification_code.dart';
import 'package:online_exam/presentation/login/login_screen.dart';
import 'package:online_exam/presentation/register/register_screen.dart';
import 'core/utils/routing/routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')], // Supported locales
      path: 'assets/translations', // Path to translations folder
      fallbackLocale: const Locale('en'), // Fallback locale
      child: RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: RoutesManager.loginRouteName,
      routes: {
        RoutesManager.loginRouteName: (_) => LoginScreen(),
        RoutesManager.registerRoteName: (_) => RegisterScreen(),
        RoutesManager.forgetRouteName: (_) => ForgetPassword(),
        RoutesManager.otpRouteName: (_) => EmailVerification(),
        RoutesManager.changePasswordRouteName: (_) => ResetPassword()
      },
    );
  }
}
