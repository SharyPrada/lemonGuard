import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/home_screen.dart';
import 'package:lemon_guard/screens/register_screen.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lemon Guard",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: "LemonGuard"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Botón de inicio de sesión
              Padding(
                padding: const EdgeInsets.only(top: 500,),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                   },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20,),
                    backgroundColor: const Color.fromARGB(255, 53, 195, 18),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 50),
                  ), 
                  child: const Text('Iniciar sesión'),
                ),
              ),
              const SizedBox(height: 20),
              // Texto debajo del botón
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: "¿No tienes una cuenta? ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextSpan(
                      text: "Regístrate",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 53, 195, 18),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
