import 'package:app/api/profile/models/profile.model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'post_author.model.dart';
import 'post_image.model.dart';
import 'vote.model.dart';

part 'post.model.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.id,
    required this.upvotes,
    required this.downvotes,
    required this.description,
    required this.author,
    required this.image,
    required this.createdAt,
  });

  final int id;

  final List<Vote> upvotes;
  final List<Vote> downvotes;

  final String description;

  final Author author;
  final Image image;

  final String createdAt;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
