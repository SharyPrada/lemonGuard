import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/provider/theme_privider.dart';
import 'package:lemon_guard_frontend/routes/routes.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:lemon_guard_frontend/utils/settings_screen.dart';
import 'package:provider/provider.dart';


class NavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onTap;
  const NavBar(
      {super.key, required this.onTap, required this.selectedItem});

  @override
  State<NavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * .015, vertical: h * .01),
            child: GNav(
              gap: 10,
              tabBorderRadius: 100,
              backgroundColor: isDarkMode ? Colors.grey[900]! : Colors.grey[100]!,
              activeColor: isDarkMode ? Colors.black : Colors.white,
              color: isDarkMode ? Colors.white : Colors.green[600], 
              tabBackgroundGradient: LinearGradient(
                colors: isDarkMode
                    ? [Colors.grey[700]!, Colors.grey[900]!]
                    : [Colors.green[300]!, Colors.green.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight),
              iconSize: 30,
              textSize: 18,
              padding:
                  EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .01),
              selectedIndex: widget.selectedItem,
              onTabChange: (index){
                switch(index){
                  case 0:
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, AppRoutes.detect);
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, AppRoutes.monitoring);
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, AppRoutes.settings);
                    break;
                }
                widget.onTap(index);
              },//widget.onTap,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.home,
                  text: 'Inicio',
                ),
                GButton(
                  icon: CupertinoIcons.camera_on_rectangle,
                  text: 'Detección',
                ),
                GButton(
                  icon: CupertinoIcons.chart_bar_alt_fill,
                  text: 'Segumiento',
                ),
                GButton(
                  icon: CupertinoIcons.gear_solid,
                  text: 'Configuración',
                )
              ],
            )));
  }
}
