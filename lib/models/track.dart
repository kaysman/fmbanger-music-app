import 'package:fmbanger/models/artist.dart';
import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'image.dart';

part 'track.g.dart';

@JsonSerializable(anyMap: true)
class Track {

  Track({ this.wiki, this.listeners, this.playcount, this.url, this.name, this.mbid, this.image, this.artist, });

  final String? name;
  final String? mbid;
  final String? url;
  final List<Image>? image;
  final String? listeners;
  final String? playcount;
  final Artist? artist;

  final Wiki? wiki;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  // getters
  String get getSmall => image!.where((element) => element.size == "small").first.text!;
  String get getMedium => image!.where((element) => element.size == "medium").first.text!;
  String get getLarge => image!.where((element) => element.size == "large").first.text!;
  String get getExtraLarge => image!.where((element) => element.size == "extralarge").first.text!;
  String get getMega => image!.where((element) => element.size == "mega").first.text!;

}

@JsonSerializable(anyMap: true)
class Tracks {

  Tracks({ this.track });

  final List<Track>? track;

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

}