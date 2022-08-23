// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
      bio: json['bio'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'user': instance.user,
      'profilePicture': instance.profilePicture,
      'updatedAt': instance.updatedAt,
    };
