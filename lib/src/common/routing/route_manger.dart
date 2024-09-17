import 'package:flutter/material.dart';
import 'package:ibm_task/src/common/routing/routes.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/screens/home_screen.dart';
import 'package:ibm_task/src/featuers/presentation/view/login/screens/login_screen.dart';

class RouteManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const  LoginScreen(),
        );
        case Routes.home:
        return MaterialPageRoute(
          builder: (_) =>   HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}