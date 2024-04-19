// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../emuns/bloc_status.dart';

class AppState {
  BlocStatusState status;
  Locale? locale;
  AppState({
    this.locale,
    required this.status,
  });

  AppState copyWith({
    Locale? locale,
    required BlocStatusState status,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      status: status,
    );
  }
}
