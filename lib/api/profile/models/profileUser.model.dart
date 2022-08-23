import 'package:json_annotation/json_annotation.dart';

part 'profileUser.model.g.dart';

@JsonSerializable()
class User {
  User({
    required this.username,
  });

  final String username;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
