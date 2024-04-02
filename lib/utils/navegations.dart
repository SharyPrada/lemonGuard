import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/login_screen.dart';
import 'package:lemon_guard/screens/register_screen.dart';
import 'package:lemon_guard/screens/users/edit_screen.dart';
import 'package:lemon_guard/screens/crop_lemon/index.dart';

void navigateToLoginScreen(BuildContext context) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
}

void navigateToRegistreScreen(BuildContext context) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const RegisterScreen()),
  );
}

void navigateToEditInfoUserScreen(BuildContext context) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const EditUserScreen()),
  );
}

void navigateToIndexCropScreen(BuildContext context) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const IndexCropScreen()),
  );
}
class NavigationService {
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

   Future<dynamic> navigateToIndexCropScreen2() {
     return navigatorKey.currentState!.push(
       MaterialPageRoute(builder: (context) => const IndexCropScreen()),
     );
   }
 }