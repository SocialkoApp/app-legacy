import 'package:app/api/profile/models/profilePicture.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({
    Key? key,
    required this.name,
    required this.username,
    required this.followers,
    required this.following,
    required this.profilePicture,
    required this.bio,
  }) : super(key: key);

  final ProfilePicture profilePicture;

  final String name;
  final String username;

  final String bio;

  final String followers;
  final String following;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),

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
                  profilePicture.url,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10.0),

        // Name
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            name,
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
            '@$username',
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
            bio,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),

        const SizedBox(height: 5.0),

        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: followers,
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
                      text: following,
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
