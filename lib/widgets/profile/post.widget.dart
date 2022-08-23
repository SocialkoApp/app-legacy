import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.width,
    required this.url,
    required this.id,
  }) : super(key: key);

  final double width;

  final int id;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(
        url,
        width: width,
        height: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
