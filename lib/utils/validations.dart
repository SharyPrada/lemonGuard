class ValidationUtils {

  // Función para validar el formato del correo electrónico
  static bool isValidEmail(String value) {
    // Utiliza una expresión regular para validar el formato de correo electrónico
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(value);
  }

  // Función para validar la contraseña
  static bool isValidPassword(String value) {
    // Verifica que la contraseña tenga al menos 8 caracteres
    return value.length >= 8;
  }

   // Función para validar nombre y apellido
  static bool isStringMinLength(String value, int minLength) {
    // Verifica que la cadena tenga al menos la longitud mínima especificada
    return value.length >= minLength;
  }
}
