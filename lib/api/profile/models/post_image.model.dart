import 'package:json_annotation/json_annotation.dart';

part 'post_image.model.g.dart';

@JsonSerializable()
class Image {
  Image({
    required this.url,
  });

  final String url;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
