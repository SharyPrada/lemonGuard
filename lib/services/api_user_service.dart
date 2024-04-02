import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lemon_guard/routes.dart';
import 'package:lemon_guard/utils/navegations.dart';
import 'package:lemon_guard/utils/functions_global.dart';
import 'package:jwt_decode/jwt_decode.dart';
//no cambiar nombre de clases ni de rutas, unicamnete cambiar en routes.dart, hay que manejar aun el manejo de respuestas

class Login {
  static const String loginUrl = ApiUserService.apiLoginUrl;

  static Future<void> login(String email, String password, BuildContext context) async {
    final body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: body,
      );

      if (response.statusCode == 200) {
        // Manejar respuesta exitosa
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access'];
        final refreshToken = responseData['refresh'];

        await storeTokens(accessToken, refreshToken);
        navigateToLoginScreen(context);

      } else {
        // Manejar error de autenticación
        final errorMessage = response.body.toString();
        showWarning(context, errorMessage);
      }
    } catch (error) {
      // Manejar errores de red
      showWarning(context, 'Error al enviar el formulario: $error');
    }
  }
}

class Register {
  static const String registerUrl = ApiUserService.apiRegisterUrl;

  static Future<Map<String, dynamic>> register(Map<String, dynamic> data, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
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
