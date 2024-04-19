// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'new_movie_video.g.dart';

@JsonSerializable()
class NewMovieVideo {
  String? name;
  String? key;
  String? site;
  String? type;
  bool? official;

  NewMovieVideo({
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
  });

  // toJSON và fromJSON
  factory NewMovieVideo.fromJson(Map<String, dynamic> json) =>
      _$NewMovieVideoFromJson(json);

  Map<String, dynamic> toJson() => _$NewMovieVideoToJson(this);
}
