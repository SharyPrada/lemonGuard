import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lemon_guard_frontend/components/navbar.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/routes/routes.dart';
import 'package:lemon_guard_frontend/services/image_upload_service.dart';
//import 'package:lemon_guard_frontend/provider/theme_privider.dart';
import 'package:lemon_guard_frontend/utils/settings_screen.dart';
//import 'package:provider/provider.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image;
  File? selectedImage;
  ImageUploadService uploadService = ImageUploadService();
  Map<String, dynamic>? _detectionResults;

  int currentPage = 1;

  @override
  void dispose() {
    _image = null;
    selectedImage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detectar Fitopatología'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
        ),
        backgroundColor: Colors.green,
      ),
      //backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                showImagePickerOption(context);
              },
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: _image != null
                    ? Image.file(
                        selectedImage!.absolute,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 30,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final results = await uploadService.uploadImage(selectedImage);
                setState(() {
                  _detectionResults = results;
                });
                // Aquí puedes llamar a un método para guardar los resultados en la base de datos
                await uploadService.saveResults(results);
              },
              child: const Text('Analizar'),
            ),
            const SizedBox(height: 100),
            _detectionResults != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _detectionResults!.length,
                      itemBuilder: (context, index) {
                        String key = _detectionResults!.keys.elementAt(index);
                        return ListTile(
                          title: Text("$key: ${_detectionResults![key]}"),
                        );
                      },
                    ),
                  )
                : const Text("No results yet"),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        onTap: (page) {/*
          setState(() {
            currentPage = page;
          });*/
          switch(page){
            case 0:
              Navigator.pushReplacementNamed(context, AppRoutes.home);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, AppRoutes.detect);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, AppRoutes.monitoring);
              break;
            case 3:
              Navigator.pushReplacementNamed(context, AppRoutes.settings);
              break;
          }
        },
        selectedItem: 1,
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(169, 29, 223, 110),
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 70),
                        Text('Gallery'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 70),
                        Text('Camera'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future<void> _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
