// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_author.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'profilePicture': instance.profilePicture,
    };
