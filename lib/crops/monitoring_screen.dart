import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lemon_guard_frontend/components/navbar.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/models/monitoring.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:lemon_guard_frontend/utils/settings_screen.dart';
//import 'package:lemon_guard_frontend/services/monitoring_services.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState()=> _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  late Future<List<TreeData>> futureTreeData;

  @override
  void initState() {
    super.initState();
    futureTreeData = loadTreeData();
  }

  Future<List<TreeData>> loadTreeData() async {
    final String response =
        await rootBundle.loadString('assets/data/trees_data.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => TreeData.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento'),
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
      body: FutureBuilder<List<TreeData>>(
        future: futureTreeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                TreeData treeData = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Registro ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fecha: ${treeData.fecha}'),
                            Text('Identificador: ${treeData.identificador}'),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Estado: ${treeData.estado}'),
                            Text('Predicción: ${treeData.prediccion}'),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Precisión: ${treeData.precision.toString()}'),
                            Text('Tratamiento: ${treeData.tratamiento}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: NavBar(
        onTap: (page) {
          /*
          setState(() {
            currentPage = page;
          });*/
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
        selectedItem: 2,
      ),
    );
  }
}
