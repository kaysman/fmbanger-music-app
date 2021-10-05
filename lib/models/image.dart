import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(anyMap: true)
class Image {
  Image({this.size, this.text});

  @JsonKey(name: "#text")
  final String? text;
  final String? size;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}