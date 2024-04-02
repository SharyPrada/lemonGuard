import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/base_style.dart';
import 'package:lemon_guard/screens/layouts/navbar.dart';

class IndexCropScreen extends StatelessWidget {
  const IndexCropScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundContainer(
       child: Scaffold(
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
  final TextEditingController fechaPlantacionController = TextEditingController();
  final TextEditingController latitudController = TextEditingController();
  final TextEditingController longitudController = TextEditingController();
  final TextEditingController tiempoCosechaController = TextEditingController();

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
                  const SizedBox(height: 20),
                  const Text(
                    "Agregar cultivo",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: fechaPlantacionController,
                    decoration: const InputDecoration(
                      labelText: "Fecha de plantación",
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: latitudController,
                          decoration: const InputDecoration(
                            labelText: "Latitud",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: longitudController,
                          decoration: const InputDecoration(
                            labelText: "Longitud",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025),
                      );

                      if (selectedDate != null) {
                        tiempoCosechaController.text = selectedDate.toString().split(' ')[0];
                      }
                    },
                    child: InkResponse(
                      child: TextField(
                        controller: tiempoCosechaController,
                        readOnly: true, // Deshabilita la escritura manual
                        decoration: const InputDecoration(
                          labelText: "Fecha de sembrado",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GreenRoundedButton( 
                      text: 'Agregar',
                      onPressed: () {}
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
