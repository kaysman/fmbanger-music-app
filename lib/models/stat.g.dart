// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map json) => Stat(
      playcount: json['playcount'] as String?,
      listeners: json['listeners'] as String?,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'listeners': instance.listeners,
      'playcount': instance.playcount,
    };
