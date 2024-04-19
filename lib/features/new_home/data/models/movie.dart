// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../../../../commom/emuns/genre.dart';

part 'movie.g.dart';

@JsonSerializable()
class NewMovie {
  int? id;
  String? title;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  String? get genre {
    final genreString = genreIds
        ?.map((e) => Genre.getGenreById(e).toString().split('.').last)
        .toList()
        .join(', ');
    return genreString;
  }

  String get posterUrl =>
      'https://image.tmdb.org/t/p/original/${posterPath ?? ' '}';
  NewMovie({
    this.title,
  });

  factory NewMovie.fromJson(Map<String, dynamic> json) =>
      _$NewMovieFromJson(json);

  Map<String, dynamic> toJson() => _$NewMovieToJson(this);
}
