import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/start_app.dart';
import 'package:lemon_guard_frontend/users/signin_screen.dart';
import 'package:lemon_guard_frontend/users/signup_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String main = '/main';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInScreen(),
    signUp: (context) => const SignUpScreen(),
    welcome: (context) => const HomeCrops(),
    main: (context) => const StartApp(),
  };
}