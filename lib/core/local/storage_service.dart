import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final _secureStorage = FlutterSecureStorage();

  // Save data using secure storage
  static Future<void> saveSecureData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read data from secure storage
  static Future<String?> readSecureData() async {
    return await _secureStorage.read(key: "token");
  }


  // Delete data from secure storage
  static Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }
}