// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import '../data/domain/entities/account_entity.dart';

abstract class AccountEvent {}

class GetAccountInfoEvent extends AccountEvent {
  // user id
  String userId;
  GetAccountInfoEvent({
    required this.userId,
  });
}

class SetAccountInfoEvent extends AccountEvent {
  AccountEntity entity;
  SetAccountInfoEvent({
    required this.entity,
  });
}
