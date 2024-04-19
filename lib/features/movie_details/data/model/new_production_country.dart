import 'package:json_annotation/json_annotation.dart';

part 'new_production_country.g.dart';

@JsonSerializable()
class NewProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? name;
  NewProductionCountry({
    this.iso31661,
    this.name,
  });

  // toJSON và fromJSON
  factory NewProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$NewProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$NewProductionCountryToJson(this);
}
