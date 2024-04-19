// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'new_genre.g.dart';

@JsonSerializable()
class NewGenre {
  int? id;
  String? name;
  NewGenre({
    this.id,
    this.name,
  });

  // toJSON và fromJSON
  factory NewGenre.fromJson(Map<String, dynamic> json) =>
      _$NewGenreFromJson(json);

  Map<String, dynamic> toJson() => _$NewGenreToJson(this);
}
