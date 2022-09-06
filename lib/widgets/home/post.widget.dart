import 'package:app/api/api.dart';
import 'package:app/api/profile/models/post.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePostWidget extends StatefulWidget {
  const HomePostWidget({
    Key? key,
    required this.width,
    required this.post,
  }) : super(key: key);

  final double width;

  final Post post;

  @override
  State<HomePostWidget> createState() => _HomePostWidgetState();
}

class _HomePostWidgetState extends State<HomePostWidget> {
  late int upvotes;
  late int downvotes;

  @override
  void initState() {
    super.initState();
    initVotes();
  }

  void initVotes() {
    setState(() {
      upvotes = widget.post.upvotes.length;
      downvotes = widget.post.downvotes.length;
    });
  }

  void upvotePost() async {
    final upvoted = await API.post.upvotePost(widget.post.id);

    setState(() {
      upvotes = upvoted.upvotes.length;
      downvotes = upvoted.downvotes.length;
    });
  }

  void downvotePost() async {
    final downvoted = await API.post.downvotePost(widget.post.id);

    setState(() {
      upvotes = downvoted.upvotes.length;
      downvotes = downvoted.downvotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
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
                    foregroundImage: NetworkImage(
                      widget.post.author.profilePicture?.url ??
                          'https://s3.eu-central-1.wasabisys.com/socialko/black_image.jpg',
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(widget.post.author.user.username),
                ],
              ),
            ),
          ),
          Image.network(widget.post.image.url),
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
                        onPressed: () => downvotePost(),
                        icon: const Icon(IconlyLight.arrowDown2),
                      ),
                      Text('$downvotes'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => upvotePost(),
                        icon: const Icon(IconlyLight.arrowUp2),
                      ),
                      Text('$upvotes'),
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
