import 'package:json_annotation/json_annotation.dart';

import 'new_movie_video.dart';

part 'new_movie_video_response.g.dart';

@JsonSerializable()
class NewMovieVideoReponse {
  int? id;
  List<NewMovieVideo>? results;
  NewMovieVideoReponse({
    this.id,
    this.results,
  });

  // toJSON và fromJSON
  factory NewMovieVideoReponse.fromJson(Map<String, dynamic> json) =>
      _$NewMovieVideoReponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewMovieVideoReponseToJson(this);
}
