import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lemon_guard/routes.dart';
import 'package:lemon_guard/utils/navegations.dart';
import 'package:lemon_guard/utils/functions_global.dart';
import 'package:jwt_decode/jwt_decode.dart';
//no cambiar nombre de clases ni de rutas, unicamnete cambiar en routes.dart, hay que manejar aun el manejo de respuestas

class GetDataCropIndex {
  static const String getDataCropIndexUrl = ApiCropService.getDataCropIndexUrl;

  static Future<Map<String, dynamic>> register(Map<String, dynamic> data, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(getDataCropIndexUrl),
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return responseData; 
      } else {
        final errorMessage = jsonDecode(response.body)['error']; 
        showWarning(context, errorMessage);
        throw errorMessage; 
      }
    } catch (error) {
      throw 'Error al enviar el formulario: $error'; 
    }
  }
}
