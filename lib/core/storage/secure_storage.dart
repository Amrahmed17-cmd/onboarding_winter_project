import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  static const String _TOKEN = 'token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _TOKEN, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _TOKEN);
  }
}
