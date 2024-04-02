import 'package:flutter/material.dart';
import 'package:lemon_guard/screens/crop_lemon/index.dart'; // Import the CropLemon screen


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // Envuelve con Builder para proporcionar contexto
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Builder(
                    builder: (context) => _buildMenu(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    final List<String> opciones = [
      'Cultivo de limón',
    ];

   final List<Function()> onTapFunctions = [
    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const IndexCropScreen())),
  ];


    return ListView.builder(
      itemCount: opciones.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(opciones[index]),
          onTap: () => onTapFunctions[index](),
        );
      },
    );
  }
}
