import 'package:app/api/api.client.dart';
import 'package:app/api/auth/models/login.dto.dart';

class Login {
  Future<Map<String, dynamic>> login(LoginDto loginDto) async {
    final response = await ApiClient.post('/auth/login', loginDto.toJson());

    return response;
  }
}
