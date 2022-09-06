import 'package:app/api/profile/models/profile.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote.model.g.dart';

@JsonSerializable()
class Vote {
  Vote({
    required this.profile,
  });

  final Profile profile;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
