import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Función para mostrar advertencias
void showWarning(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

//obtenr tokens y almamcenarlos localmente 
Future<void> storeTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();

    // Almacena los tokens
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
}

// Obtain tokens from local storage
Future<Map<String, String>?> getStoredTokens() async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken');
  final refreshToken = prefs.getString('refreshToken');

  if (accessToken != null && refreshToken != null) {
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  } else {
    return null;
  }
}

// Validate a token (replace with your actual validation logic)
Future<bool> validateToken(String token) async {
  // Simulate validation by checking for a specific string
  // Replace this with a server-side validation call
  return token == 'your_valid_token';
}

// Check for a valid token stored locally
Future<bool> hasValidToken() async {
  final tokens = await getStoredTokens();

  if (tokens != null) {
    final accessToken = tokens['accessToken'];
    if (accessToken != null) {
      final isValid = await validateToken(accessToken);
      return isValid;
    } else {
      return false; // Access token missing
    }
  } else {
    return false; // No tokens stored
  }
}