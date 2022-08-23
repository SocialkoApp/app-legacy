import 'package:app/api/api.client.dart';
import 'package:app/api/profile/models/profile.model.dart';

class ProfileAPI {
  Future<Profile> me() async {
    final response = await ApiClient.get('/profile');
    final profile = Profile.fromJson(response);

    return profile;
  }
}
