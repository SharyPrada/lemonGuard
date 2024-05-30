import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String key, String value) async {
    if (value != null ) {
      await _storage.write(key: key, value: value);
    }
  }

  static Future<String?> getToken(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteAllTokens() async {
    await _storage.deleteAll();
  }
}