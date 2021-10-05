import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable(anyMap: true)
class Stat {
  Stat({
    this.playcount,
    this.listeners,
  });

  final String? listeners;
  final String? playcount;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}