import 'package:app/api/auth/auth.api.dart';
import 'package:app/api/home/home.api.dart';
import 'package:app/api/post/post.api.dart';
import 'package:app/api/profile/profile.api.dart';

class API {
  static AuthAPI auth = AuthAPI();
  static ProfileAPI profile = ProfileAPI();
  static HomeAPI home = HomeAPI();
  static PostAPI post = PostAPI();
}
