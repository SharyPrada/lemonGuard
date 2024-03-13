import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/register_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Botones dentro del contenedor blanco redondeado
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: const Color.fromARGB(255, 53, 195, 18),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(125, 50),
                            ),
                            child: const Text('Iniciar sesión'),
                          ),
                          const SizedBox(width: 15), 
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor:  const Color.fromARGB(255, 124, 129, 122),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(125, 50),
                            ),
                            child: const Text('Registrarse'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), 
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Bienvenido a LemonGuard ",
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10), 
                      Center(
                        child: ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: const Color.fromARGB(255, 53, 195, 18),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Iniciar sesión'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}