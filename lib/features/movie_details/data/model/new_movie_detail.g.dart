// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMovieDetail _$NewMovieDetailFromJson(Map<String, dynamic> json) =>
    NewMovieDetail(
      id: json['id'] as int?,
      budget: (json['budget'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => NewGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String?,
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => NewProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      runtime: (json['runtime'] as num?)?.toDouble(),
      revenue: (json['revenue'] as num?)?.toDouble(),
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$NewMovieDetailToJson(NewMovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budget': instance.budget,
      'genres': instance.genres,
      'overview': instance.overview,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'revenue': instance.revenue,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
