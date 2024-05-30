import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lemon_guard_frontend/services/token_storage.dart';
import 'package:logger/logger.dart';

class ApiUserService {
  static const String apiBaseUrl = 'http://lemonguard.online/api/';
  static const String apiLoginUrl = '${apiBaseUrl}user/users/login/';
  static const String apiRegisterUrl = '${apiBaseUrl}user/users/signup/';
  static final logger = Logger();

  static Future<void> login(String email, String password, BuildContext context) async {
    final body = json.encode({'email': email, 'password': password});
    logger.d('Sending login request to $apiLoginUrl with body $body');

    try {
      final response = await http.post(
        Uri.parse(apiLoginUrl),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      logger.d('Received response with status code ${response.statusCode}');
      logger.d('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final accessToken = responseData['access'];
        final refreshToken = responseData['refresh'];

        await TokenStorage.saveToken('accessToken', accessToken);
        await TokenStorage.saveToken('refreshToken', refreshToken);

        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        final errorMessage = json.decode(response.body)['error'] ?? 'Unknown error';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (error) {
      logger.e('Error during login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting form: $error')),
      );
    }
  }

  static Future<void> register(String email, String name, String password, BuildContext context) async {
    final body = json.encode({'email': email, 'name': name, 'password': password});
    logger.d('Sending register request to $apiRegisterUrl with body $body');

    try {
      final response = await http.post(
        Uri.parse(apiRegisterUrl),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      logger.d('Received response with status code ${response.statusCode}');
      logger.d('Response body: ${response.body}');

      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        final errorMessage = json.decode(response.body)['error'] ?? 'Unknown error';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (error) {
      logger.e('Error during registration: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting form: $error')),
      );
    }
  }
}


