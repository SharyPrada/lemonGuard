import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/start_app.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:lemon_guard_frontend/users/signin_screen.dart';
import 'package:lemon_guard_frontend/users/signup_screen.dart';
import 'package:lemon_guard_frontend/utils/settings_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signUp';
  static const String start = '/start';
  static const String home = '/home';
  static const String detect = '/detect';
  static const String monitoring = '/monitoring';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    start: (context) => const StartApp(),
    home: (context) => const HomeCrops(),
    detect: (context) => const PickImage(),
    monitoring: (context) => const MonitoringScreen(),
    settings: (context) => const SettingsScreen(),
  };
}