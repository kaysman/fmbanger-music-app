// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map json) => Track(
      wiki: json['wiki'] == null
          ? null
          : Wiki.fromJson(Map<String, dynamic>.from(json['wiki'] as Map)),
      duration: json['duration'] as String?,
      listeners: json['listeners'] as String?,
      playcount: json['playcount'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      mbid: json['mbid'] as String?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(Map<String, dynamic>.from(json['artist'] as Map)),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'mbid': instance.mbid,
      'url': instance.url,
      'image': instance.image,
      'listeners': instance.listeners,
      'playcount': instance.playcount,
      'artist': instance.artist,
      'duration': instance.duration,
      'wiki': instance.wiki,
    };

Tracks _$TracksFromJson(Map json) => Tracks(
      track: (json['track'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'track': instance.track,
    };
