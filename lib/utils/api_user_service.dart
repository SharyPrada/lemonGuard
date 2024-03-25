import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lemon_guard/routes.dart';
//no cambiar nombre de clases ni de rutas, unicamnete cambiar en routes.dart, hay que manejar aun el manejo de respuestas
class Login {

  static const String loginUrl = ApiService.apiLoginUrl; // URL de inicio de sesión

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: body
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['error'];
      }
    } catch (error) {
      throw 'Error al enviar el formulario: $error';
    }
  }
}

class Register {
  
  static const String registerUrl = ApiService.apiRegisterUrl;

  static Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        body: data
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['error'];
      }
    } catch (error) {
      throw 'Error al enviar el formulario: $error';
    }
  }
}
