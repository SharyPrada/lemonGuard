import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/components/navbar.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:lemon_guard_frontend/utils/settings_screen.dart';

class HomeCrops extends StatelessWidget {
  const HomeCrops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeCrops()),
              );
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¡Bienvenido a la app de detección y monitoreo de enfermedades del limón tahití!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        onTap: (page) {
          switch (page) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeCrops()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PickImage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MonitoringScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              break;
          }
        },
        selectedItem: 0,
      ),
    );
  }
}
