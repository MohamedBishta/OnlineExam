import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/routing/routes_manager.dart';
import 'package:online_exam/presentation/home/home_screen.dart';

import '../../../presentation/auth/login/login_screen.dart';
import '../../../presentation/auth/register/register_screen.dart';


abstract class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.loginRouteName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.registerRoteName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
        case RoutesManager.homeRoteName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Route')),
      body: const Center(child: Text('Unknown Route')),
    );
  }
}
