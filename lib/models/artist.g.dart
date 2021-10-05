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
    };
