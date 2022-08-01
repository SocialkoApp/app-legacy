import 'package:json_annotation/json_annotation.dart';

part 'register.dto.g.dart';

@JsonSerializable()
class RegisterDto {
  RegisterDto({
    required this.email,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String username;
  final String password;
  final String firstName;
  final String lastName;

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
