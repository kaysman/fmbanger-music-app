import 'package:fmbanger/models/image.dart';
import 'package:fmbanger/models/track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(anyMap: true)
class Album {
  Album({
    this.listeners,
    this.name,
    this.artist,
    this.tracks,
    this.image,
    this.mbid,
    this.url,
    this.playcount,
    this.tags,
    this.wiki,
  });

  final String? artist;
  final String? mbid;
  final Tags? tags;
  final String? playcount;
  final List<Image>? image;
  final Tracks? tracks;
  final String? url;
  final String? name;
  final String? listeners;
  final Wiki? wiki;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  // getters
  String get getSmall => image!.where((element) => element.size == "small").first.text!;
  String get getMedium => image!.where((element) => element.size == "medium").first.text!;
  String get getLarge => image!.where((element) => element.size == "large").first.text!;
  String get getExtraLarge => image!.where((element) => element.size == "extralarge").first.text!;
  String get getMega => image!.where((element) => element.size == "mega").first.text!;


}

@JsonSerializable(anyMap: true)
class Tags {

  Tags({this.tag});

  final List<Tag>? tag;

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

}

@JsonSerializable(anyMap: true)
class Tag {

  Tag({this.url, this.name});

  final String? url;
  final String? name;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

}

@JsonSerializable(anyMap: true)
class Wiki {
  Wiki({ this.content, this.published, this.summary });

  final String? published;
  final String? summary;
  final String? content;

  factory Wiki.fromJson(Map<String, dynamic> json) => _$WikiFromJson(json);

}
