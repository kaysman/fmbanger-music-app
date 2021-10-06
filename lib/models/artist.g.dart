// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map json) => Artist(
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      name: json['name'] as String?,
      ontour: json['ontour'] as String?,
      playcount: json['playcount'] as String?,
      stats: json['stats'] == null
          ? null
          : Stat.fromJson(Map<String, dynamic>.from(json['stats'] as Map)),
      streamable: json['streamable'] as String?,
      url: json['url'] as String?,
      wiki: json['bio'] == null
          ? null
          : Wiki.fromJson(Map<String, dynamic>.from(json['bio'] as Map)),
      similar: json['similar'] == null
          ? null
          : Similar.fromJson(Map<String, dynamic>.from(json['similar'] as Map)),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'mbid': instance.mbid,
      'url': instance.url,
      'streamable': instance.streamable,
      'ontour': instance.ontour,
      'stats': instance.stats,
      'image': instance.image,
      'listeners': instance.listeners,
      'playcount': instance.playcount,
      'similar': instance.similar,
      'bio': instance.wiki,
    };

Similar _$SimilarFromJson(Map json) => Similar(
      artist: (json['artist'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$SimilarToJson(Similar instance) => <String, dynamic>{
      'artist': instance.artist,
    };
