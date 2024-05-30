import 'dart:io';
import 'package:dio/dio.dart';

class ImageUploadService {
  Future<Map<String, dynamic>> uploadImage(File? selectedImage) async {
    try {
      Dio dio = Dio();
      if (selectedImage != null) {
        FormData formData = FormData.fromMap({
          'userFile': await MultipartFile.fromFile(selectedImage.path, filename: 'image.png'),
        });

        Response response = await dio.post(
          'http://your-api-url.com/analyze', // ENDPOINT para analizar la imagen
          data: formData,
        );

        if (response.statusCode == 200) {
          print('Image uploaded successfully');
          print(response.data);
          return response.data;
        } else {
          print('Image upload failed. Error: ${response.statusCode}');
          return {};
        }
      } else {
        return {};
      }
    } catch (error) {
      print('Error uploading image: $error');
      return {};
    }
  }

  Future<void> saveResults(Map<String, dynamic> results) async {
    try {
      Dio dio = Dio();

      Response response = await dio.post(
        'http://your-api-url.com/save_results', // ENDPOINT para guardar los resultados
        data: results,
      );

      if (response.statusCode == 200) {
        print('Results saved successfully');
      } else {
        print('Failed to save results. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error saving results: $error');
    }
  }
}
