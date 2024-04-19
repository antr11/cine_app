// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'new_genre.dart';
import 'new_production_country.dart';

part 'new_movie_detail.g.dart';

@JsonSerializable()
class NewMovieDetail {
  int? id;
  double? budget;
  List<NewGenre>? genres;
  String? overview;
  @JsonKey(name: 'production_countries')
  List<NewProductionCountry>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  double? runtime;
  double? revenue;
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  NewMovieDetail({
    this.id,
    this.budget,
    this.genres,
    this.overview,
    this.productionCountries,
    this.releaseDate,
    this.runtime,
    this.revenue,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  // toJSON và fromJSON
  factory NewMovieDetail.fromJson(Map<String, dynamic> json) =>
      _$NewMovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NewMovieDetailToJson(this);
}
