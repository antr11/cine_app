// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_movie_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMovieVideo _$NewMovieVideoFromJson(Map<String, dynamic> json) =>
    NewMovieVideo(
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
    );

Map<String, dynamic> _$NewMovieVideoToJson(NewMovieVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'official': instance.official,
    };
