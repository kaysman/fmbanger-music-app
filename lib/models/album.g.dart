// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map json) => Album(
      listeners: json['listeners'] as String?,
      name: json['name'] as String?,
      artist: json['artist'] as String?,
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(Map<String, dynamic>.from(json['tracks'] as Map)),
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      playcount: json['playcount'] as String?,
      tags: json['tags'] == null
          ? null
          : Tags.fromJson(Map<String, dynamic>.from(json['tags'] as Map)),
      wiki: json['wiki'] == null
          ? null
          : Wiki.fromJson(Map<String, dynamic>.from(json['wiki'] as Map)),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'artist': instance.artist,
      'mbid': instance.mbid,
      'tags': instance.tags,
      'playcount': instance.playcount,
      'image': instance.image,
      'tracks': instance.tracks,
      'url': instance.url,
      'name': instance.name,
      'listeners': instance.listeners,
      'wiki': instance.wiki,
    };

Tags _$TagsFromJson(Map json) => Tags(
      tag: (json['tag'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'tag': instance.tag,
    };

Tag _$TagFromJson(Map json) => Tag(
      url: json['url'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

Wiki _$WikiFromJson(Map json) => Wiki(
      content: json['content'] as String?,
      published: json['published'] as String?,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$WikiToJson(Wiki instance) => <String, dynamic>{
      'published': instance.published,
      'summary': instance.summary,
      'content': instance.content,
    };
