import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/base_style.dart';
import 'package:lemon_guard/utils/validations.dart';
import 'package:lemon_guard/services/api_user_service.dart';
import 'package:lemon_guard/utils/navegations.dart';
import 'package:lemon_guard/utils/functions_global.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.7,
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
                            onPressed: () {navigateToLoginScreen(context); },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: const Color.fromARGB(255, 124, 129, 122),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(125, 50),
                            ),
                            child: const Text('Iniciar sesión'),
                          ),
                          const SizedBox(width: 15), 
                          GreenRoundedButton( 
                            text: 'Registrarse',
                            onPressed: () {},
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
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Nombre',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Apellido',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10), 
                      Center(
                        child: GreenRoundedButton( 
                          text: 'Iniciar sesión',
                          onPressed: () {
                            // Obtiene el valores
                            final name = nameController.text.trim();
                            final lastname = lastNameController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            // Validar datos
                            if (name.isEmpty || !ValidationUtils.isStringMinLength(name, 3)) {showWarning(context,'El nombre debe tener almenos 3 caracteres.');
                              return;
                            }
                            if (lastname.isEmpty || !ValidationUtils.isStringMinLength(lastname, 3)) {showWarning(context,'El apellido debe tener almenos 3 caracteres.');
                              return;
                            }
                            if (email.isEmpty || !ValidationUtils.isValidEmail(email)) {showWarning(context,'Por favor, introduce un correo electrónico válido.');
                              return;
                            }
                            if (password.isEmpty || !ValidationUtils.isValidPassword(password)) {showWarning(context,'La contraseña debe tener al menos 8 caracteres.');
                              return;
                            }
                            Map<String, dynamic> data = {'name': name, 'lastname': lastname, 'email': email,'password': password,};
                            Register.register(data, context);
                          },
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


