import 'package:app/api/api.client.dart';
import 'package:app/api/profile/models/post.model.dart';

class HomeAPI {
  Future<List<Post>> getPosts() async {
    final response = await ApiClient.getMany('/posts');
    print(response);

    final List<Post> posts = List.from(response).map((e) {
      print(e);
      return Post.fromJson(e);
    }).toList();

    return posts;
  }
}
