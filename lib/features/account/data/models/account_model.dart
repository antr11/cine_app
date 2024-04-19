// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../../commom/emuns/gender.dart';
import '../domain/entities/account_entity.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'avartar_url')
  String? avatarUrl;
  @JsonKey(name: 'full_name')
  String? fullName;
  DateTime? dob;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  Gender? gender;
  String? city;
  AccountModel({
    this.userId,
    this.avatarUrl,
    this.fullName,
    this.dob,
    this.phoneNumber,
    this.email,
    this.gender,
    this.city,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  AccountEntity convertToEntity() {
    return AccountEntity(
      id: userId,
      avatarUrl: avatarUrl,
      fullName: fullName,
      dateOfBirth: dob,
      phoneNumber: phoneNumber,
      email: email,
      gender: gender,
      city: city,
    );
  }

  factory AccountModel.fromEntity(AccountEntity entity) {
    return AccountModel(
      userId: entity.id,
      avatarUrl: entity.avatarUrl,
      fullName: entity.fullName,
      dob: entity.dateOfBirth,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      gender: entity.gender,
      city: entity.city,
    );
  }
}
