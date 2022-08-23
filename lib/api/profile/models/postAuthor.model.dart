import 'package:app/api/profile/models/profilePicture.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'profileUser.model.dart';

part 'postAuthor.model.g.dart';

@JsonSerializable()
class Author {
  Author({
    required this.id,
    required this.user,
    required this.profilePicture,
  });

  final int id;

  final User user;

  final ProfilePicture profilePicture;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
