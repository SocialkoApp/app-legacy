import 'package:app/api/api.client.dart';
import 'package:app/api/auth/models/send_confirmation_email.dto.dart';

class ConfirmEmail {
  Future<Map<String, dynamic>> sendConfirmationEmail(
      SendEmailConfirmationDto confirmationDto) async {
    final response =
        await ApiClient.put('/email-confirmation', confirmationDto.toJson());

    return response;
  }
}
