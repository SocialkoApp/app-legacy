import 'package:app/api/profile/models/profile_picture.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'profile_user.model.dart';

part 'post_author.model.g.dart';

@JsonSerializable()
class Author {
  Author({
    required this.id,
    required this.user,
    this.profilePicture,
  });

  final int id;

  final User user;

  final ProfilePicture? profilePicture;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
