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
  final List<Tag>? tags;
  final String? playcount;
  final List<Image>? image;
  final List<Track>? tracks;
  final String? url;
  final String? name;
  final String? listeners;
  final Wiki? wiki;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
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
