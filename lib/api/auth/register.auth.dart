import 'package:app/api/api.client.dart';
import 'package:app/api/auth/models/register.dto.dart';

class Register {
  Future<Map<String, dynamic>> register(RegisterDto registerDto) async {
    final response = await ApiClient.post('/user', registerDto.toJson());

    return response;
  }
}
