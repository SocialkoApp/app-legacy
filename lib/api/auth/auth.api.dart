import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './login.auth.dart';

const storage = FlutterSecureStorage();

class AuthAPI {
  static Login login = Login();

  void saveToken(String token) async {
    await storage.write(
      key: 'token',
      value: token,
    );
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<bool> isLoggedIn() {
    return storage.containsKey(key: 'token');
  }
}
