import 'package:json_annotation/json_annotation.dart';
import 'image.dart';
import 'stat.dart';

part 'artist.g.dart';

@JsonSerializable(anyMap: true)
class Artist {
  Artist({
    this.image,
    this.listeners,
    this.mbid,
    this.name,
    this.ontour,
    this.playcount,
    this.stats,
    this.streamable,
    this.url,
  });

  final String? name;
  final String? mbid;
  final String? url;
  final String? streamable;
  final String? ontour;
  final Stat? stats;
  final List<Image>? image;
  final String? listeners;
  final String? playcount;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);


  // getters
  String get getSmall => image!.where((element) => element.size == "small").first.text!;
  String get getMedium => image!.where((element) => element.size == "medium").first.text!;
  String get getLarge => image!.where((element) => element.size == "large ").first.text!;
  String get getExtraLarge => image!.where((element) => element.size == "extralarge").first.text!;
  String get getMega => image!.where((element) => element.size == "mega").first.text!;
}




