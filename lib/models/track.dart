import 'package:fmbanger/models/artist.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'track.g.dart';

@JsonSerializable(anyMap: true)
class Track {

  Track({ this.listeners, this.playcount, this.url, this.name, this.mbid, this.image, this.artist, });

  final String? name;
  final String? mbid;
  final String? url;
  final List<Image>? image;
  final String? listeners;
  final String? playcount;
  final Artist? artist;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

}