import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/presentation/auth/login/login_screen.dart';
import 'package:online_exam/presentation/auth/register/register_screen.dart';
import 'package:online_exam/presentation/home/home_screen.dart';

import 'core/local/prefs_helper.dart';
import 'core/utils/routing/routes_manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        initialRoute: PrefsHelper.getToken().isNotEmpty?RoutesManager.homeRoteName:RoutesManager.loginRouteName,
        routes: {
          RoutesManager.loginRouteName: (_) => LoginScreen(),
          RoutesManager.registerRoteName: (_) => RegisterScreen(),
          RoutesManager.homeRoteName: (_) => HomeScreen(),
        },
      ),
    );
  }
}
