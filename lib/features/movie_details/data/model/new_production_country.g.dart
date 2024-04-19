// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_production_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProductionCountry _$NewProductionCountryFromJson(
        Map<String, dynamic> json) =>
    NewProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NewProductionCountryToJson(
        NewProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };
