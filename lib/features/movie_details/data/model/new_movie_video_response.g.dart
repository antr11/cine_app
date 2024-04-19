// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_movie_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMovieVideoReponse _$NewMovieVideoReponseFromJson(
        Map<String, dynamic> json) =>
    NewMovieVideoReponse(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => NewMovieVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewMovieVideoReponseToJson(
        NewMovieVideoReponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
