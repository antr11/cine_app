// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMovie _$NewMovieFromJson(Map<String, dynamic> json) => NewMovie(
      title: json['title'] as String?,
    )
      ..id = json['id'] as int?
      ..genreIds =
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..posterPath = json['poster_path'] as String?
      ..voteAverage = (json['vote_average'] as num?)?.toDouble();

Map<String, dynamic> _$NewMovieToJson(NewMovie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
