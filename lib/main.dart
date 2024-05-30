import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/provider/theme_privider.dart';
import 'package:lemon_guard_frontend/routes/routes.dart';
//import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/start_app.dart';
import 'package:provider/provider.dart';
//import 'package:lemon_guard_frontend/upload_image/pick_image.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
       ChangeNotifierProvider(
        create: (context) => ThemeProvider()), 
      ],
      child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: AppRoutes.start,  // Define la ruta inicial
      routes: AppRoutes.routes,
    );
  }
}

