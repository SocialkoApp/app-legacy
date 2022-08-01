import 'package:app/api/api.client.dart';

class Login {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await ApiClient.post('/auth/login', body);

    return response;
  }
}
