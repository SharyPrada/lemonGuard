import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/components/navbar.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/provider/theme_privider.dart';
import 'package:lemon_guard_frontend/routes/routes.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home); //Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const Divider(),
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (bool value) {
                themeProvider.toggleTheme(value);
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                 top: 250.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, AppRoutes.start);
                  },
                  child: const Text('Cerrar Sesión'),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        onTap: (page) {
          switch(page){
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
        },
        selectedItem: 3, // Esto selecciona el tab de Favoritos
      ),
    );
  }
}