import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/di/di.dart';
import 'package:online_exam/config/theme/my_theme.dart';
import 'package:online_exam/core/utils/bloc_observer.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/shared_prefrence_manager.dart';
import 'package:online_exam/presentation/home/home_screen.dart';
import 'package:online_exam/presentation/home/tabs/profile/edite_profile_tap.dart';
import 'package:online_exam/presentation/home/tabs/profile/reset_password_view.dart';
import 'package:online_exam/presentation/login/login_screen.dart';
import 'package:online_exam/presentation/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferencesManager.initialize();
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
        initialRoute: RoutesManager.homeRoteName,
        routes: {
          RoutesManager.loginRouteName: (_) => LoginScreen(),
          RoutesManager.registerRoteName: (_) => RegisterScreen(),
          RoutesManager.homeRoteName: (_) => HomeScreen(),
          RoutesManager.editeProfileRoteName: (_) => EditeProfileTab(),
          RoutesManager.resetPasswordRoteName: (_) => ResetPasswordView(),
        },
      ),
    );
  }
}
