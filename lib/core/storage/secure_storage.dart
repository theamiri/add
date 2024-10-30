import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  final String key;
  SecureStorage({required this.key});

  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> save({
    required Map<String, dynamic> value,
  }) async {
    final jsonString = jsonEncode(value);
    await secureStorage.write(key: key, value: jsonString);
  }

  Future<Map<String, dynamic>?> get() async {
    final jsonString = await secureStorage.read(key: key);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> delete() async {
    await secureStorage.delete(key: key);
  }
}
