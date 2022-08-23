import 'package:app/api/api.dart';
import 'package:app/api/profile/models/post.model.dart';
import 'package:app/api/profile/models/profile.model.dart';
import 'package:app/api/profile/models/profilePicture.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/profile/head.widget.dart';
import 'package:app/widgets/profile/post.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String getDefaultAvatar(String fullName) {
  final String url =
      'https://ui-avatars.com/api/?background=820B8A&color=fff&name=${fullName.replaceAll(RegExp(r' '), '+')}';

  return url;
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loading = true;
  bool _loadingPosts = true;

  late final Profile _profile;
  late final String _fullName;
  late final List<Post> _posts;

  @override
  void initState() {
    super.initState();
    getProfile();
    getPosts();
  }

  getProfile() async {
    final profile = await API.profile.me();

    setState(() {
      _profile = profile;
      _loading = false;
      _fullName = '${_profile.firstName} ${_profile.lastName}';
    });
  }

  getPosts() async {
    final posts = await API.profile.getMyPosts();

    setState(() {
      _posts = posts;
      _loadingPosts = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return _loading
        ? Container(
            color: AppAssets.colors.background,
            child: const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          )
        : Container(
            color: AppAssets.colors.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'socialko',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          IconlyLight.setting,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ProfileHead(
                  name: '${_profile.firstName} ${_profile.lastName}',
                  username: _profile.user.username,
                  bio: _profile.bio ?? "A Socialko user",
                  profilePicture: _profile.profilePicture ??
                      ProfilePicture(
                        url: getDefaultAvatar(_fullName),
                      ),
                  followers: '465',
                  following: '264',
                ),
                const SizedBox(height: 20.0),
                _loadingPosts
                    ? const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                        ),
                      )
                    : SizedBox(
                        width: width,
                        height: height * 0.6,
                        child: GridView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (context, index) => PostWidget(
                            width: width / 3,
                            url: _posts[index].image.url,
                            id: _posts[index].id,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                        ),
                      ),
              ],
            ),
          );
  }
}
