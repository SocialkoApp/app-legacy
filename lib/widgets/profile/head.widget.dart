import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({Key? key}) : super(key: key);

  final String _banner =
      'https://pbs.twimg.com/profile_banners/1108654697131462656/1632560207/1500x500';
  final String _profilePicture =
      'https://s3.eu-central-1.wasabisys.com/aiken/profile_aiken.jpeg';

  final String _name = 'Aiken Tine Ahac';
  final String _username = 'aikenahac';

  final String _bio =
      '‘03 | Vegova | Full-Stack Developer\nFather to @juje_macek\nG ❤';

  final String _followers = '465';
  final String _following = '264';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner and profile picture
        SizedBox(
          height: 190.0,
          child: Stack(
            children: [
              // Banner
              Image.network(
                _banner,
                width: width,
                height: 150,
              ),

              // Profile picture
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: AppAssets.colors.background,
                    child: CircleAvatar(
                      radius: 45.0,
                      foregroundImage: NetworkImage(
                        _profilePicture,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10.0),

        // Name
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            _name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Username
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            '@$_username',
            style: TextStyle(
              fontSize: 14.0,
              color: AppAssets.colors.surfaceHighlight,
            ),
          ),
        ),

        const SizedBox(height: 20.0),

        // Bio
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            _bio,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),

        // const SizedBox(height: 5.0),

        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _followers,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' followers',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _following,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' following',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
