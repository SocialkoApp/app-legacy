import 'package:app/api/profile/models/post.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePostWidget extends StatelessWidget {
  const HomePostWidget({
    Key? key,
    required this.width,
    required this.post,
  }) : super(key: key);

  final double width;

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: AppAssets.colors.backgroundHighlight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(post.author.profilePicture?.url ?? ''),
                  ),
                  const SizedBox(width: 10.0),
                  Text(post.author.user.username),
                ],
              ),
            ),
          ),
          Image.network(post.image.url),
          Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: AppAssets.colors.backgroundHighlight,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(IconlyLight.chat),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(IconlyLight.arrowDown2),
                      ),
                      Text('${post.downvotes}'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(IconlyLight.arrowUp2),
                      ),
                      Text('${post.upvotes}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
