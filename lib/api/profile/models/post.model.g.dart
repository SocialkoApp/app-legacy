// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      upvotes: (json['upvotes'] as List<dynamic>)
          .map((e) => Vote.fromJson(e as Map<String, dynamic>))
          .toList(),
      downvotes: (json['downvotes'] as List<dynamic>)
          .map((e) => Vote.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'description': instance.description,
      'author': instance.author,
      'image': instance.image,
      'createdAt': instance.createdAt,
    };
