// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vote _$VoteFromJson(Map<String, dynamic> json) => Vote(
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoteToJson(Vote instance) => <String, dynamic>{
      'profile': instance.profile,
    };
