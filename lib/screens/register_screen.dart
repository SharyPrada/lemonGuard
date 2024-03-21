import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/home_screen.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor:
                                  const Color.fromARGB(255, 124, 129, 122),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(125, 50),
                            ),
                            child: const Text('Iniciar sesión'),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor:
                                  const Color.fromARGB(255, 53, 195, 18),
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
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Nombre',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Apellido',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_nameController.text.isEmpty ||
                                _lastNameController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Todos los campos son requeridos.'),
                                ),
                              );
                            } else {
                              _registerUser(context);
                              _nameController.clear();
                              _lastNameController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor:
                                const Color.fromARGB(255, 53, 195, 18),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Registrarse'),
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

void _registerUser(BuildContext context) async {
  String name = _nameController.text;
  String lastName = _lastNameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  print('Nombre: $name');
  print('Apellidos: $lastName');
  print('Email: $email');
  print('Contraseña: $password');

  try {
    // Aquí deberías implementar la lógica para guardar los datos en una base de datos
    await _saveUserData(name, lastName, email, password);

    // Muestra un mensaje de registro exitoso
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Exitoso'),
          content: const Text('¡Tu registro ha sido exitoso!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  } catch (error) {
    // Maneja cualquier error que ocurra al guardar los datos
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Hubo un error al registrar el usuario.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

Future<void> _saveUserData(
    String name, String lastName, String email, String password) async {
  // Aquí deberías implementar la lógica para guardar los datos en una base de datos
  // Por ejemplo, puedes llamar a una función que maneje esta lógica
}
