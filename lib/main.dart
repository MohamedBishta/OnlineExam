import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/presentation/login/login_screen.dart';
import 'package:online_exam/presentation/register/register_screen.dart';

import 'core/utils/routing/routes_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        initialRoute: RoutesManager.registerRoteName,
        routes: {
          RoutesManager.loginRouteName: (_) => LoginScreen(),
          RoutesManager.registerRoteName: (_) => RegisterScreen(),
        },
      ),
    );
  }
}
