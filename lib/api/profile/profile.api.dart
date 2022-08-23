import 'package:app/api/api.client.dart';
import 'package:app/api/profile/models/post.model.dart';
import 'package:app/api/profile/models/profile.model.dart';

class ProfileAPI {
  Future<Profile> me() async {
    final response = await ApiClient.get('/profile');
    final profile = Profile.fromJson(response);

    return profile;
  }

  Future<List<Post>> getMyPosts() async {
    final response = await ApiClient.getMany('/posts/me');

    final List<Post> posts = List.from(response).map((e) {
      return Post.fromJson(e);
    }).toList();

    return posts;
  }
}
