import 'package:json_annotation/json_annotation.dart';
import 'profile_picture.model.dart';
import 'profile_user.model.dart';

part 'profile.model.g.dart';

@JsonSerializable()
class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.user,
    required this.updatedAt,
    this.bio,
    this.profilePicture,
  });

  final int id;

  final String firstName;
  final String lastName;

  final String? bio;

  final User user;

  final ProfilePicture? profilePicture;

  final String updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
