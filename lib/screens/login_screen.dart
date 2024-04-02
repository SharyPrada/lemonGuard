import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/base_style.dart';
import 'package:lemon_guard/screens/layouts/navbar.dart';
import 'package:lemon_guard/utils/validations.dart';
import 'package:lemon_guard/services/api_user_service.dart';
import 'package:lemon_guard/utils/navegations.dart';
import 'package:lemon_guard/utils/functions_global.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundContainer(
        child: Stack( // Usar Stack para superponer el NavBar
          children: [
            HomeBody(), 
            Positioned( 
              top : 0.0,
              left: 0.0,
              right: 0.0,
              child: NavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}
class _HomeBodyState extends State<HomeBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GreenRoundedButton( 
                        text: 'Iniciar sesión',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          navigateToRegistreScreen(context);
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: const Color.fromARGB(255, 124, 129, 122),
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
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GreenRoundedButton( 
                      text: 'Iniciar sesión',
                      onPressed: () {
                        // Obtiene el valor del correo electrónico y la contraseña
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (!ValidationUtils.isValidEmail(email)) {
                          showWarning(context, "El correo electrónico no es válido");
                          return;
                        }
                        if (!ValidationUtils.isValidPassword(password)) {
                          showWarning(context, "La contraseña debe tener al menos 8 caracteres.");
                          return;
                        }
                        Login.login(email, password, context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}