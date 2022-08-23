import 'package:json_annotation/json_annotation.dart';

part 'profile_picture.model.g.dart';

@JsonSerializable()
class ProfilePicture {
  ProfilePicture({
    required this.url,
  });

  final String url;

  factory ProfilePicture.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);
}
