import 'package:app/api/api.client.dart';
import 'package:app/api/profile/models/post.model.dart';

class PostAPI {
  Future<Post> upvotePost(int id) async {
    final response = await ApiClient.put('/posts/upvote/$id');

    return Post.fromJson(response);
  }

  Future<Post> downvotePost(int id) async {
    final response = await ApiClient.put('/posts/downvote/$id');
    print(response);

    return Post.fromJson(response);
  }
}
