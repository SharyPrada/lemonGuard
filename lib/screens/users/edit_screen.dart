import 'package:flutter/material.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  @override
  Widget build(BuildContext context) {
    bool isEnabled = false;
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
                      const SizedBox(height: 20), 
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Juana Perez",
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          enabled: isEnabled,
                          labelText: 'Nombre',
                          hintText: 'Juana',
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 53, 195, 18),
                            ),
                            onPressed: () {
                              setState(() {
                                isEnabled = true;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          enabled: isEnabled,
                          labelText: 'Apellidos',
                          hintText: 'Pérez',
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 53, 195, 18),
                            ),
                            onPressed: () {
                              setState(() {
                                isEnabled = true;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), 
                      TextField(
                        decoration: InputDecoration(
                          enabled: isEnabled,
                          labelText: 'Email',
                          hintText: 'Juanaperez@gmail.com',
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 53, 195, 18),
                            ),
                            onPressed: () {
                              setState(() {
                                isEnabled = true;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          enabled:  isEnabled,
                          labelText: 'Contraseña',
                          hintText: 'dvkdfm4894jfref3',
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 53, 195, 18),
                            ),
                            onPressed: () {
                              setState(() {
                                isEnabled = true;
                              });
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: const Color.fromARGB(255, 53, 195, 18),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Actualizar'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: const Color.fromARGB(255, 188, 34, 34),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Eliminar cuenta'),
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
