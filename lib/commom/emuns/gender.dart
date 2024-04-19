import 'package:flutter/material.dart';

import '../ultis/localizations.dart';

enum Gender {
  male,
  female,
  other;

  String getTitle(BuildContext context) {
    switch (this) {
      case Gender.male:
        return translate(context).male;
      case Gender.female:
        return translate(context).female;
      case Gender.other:
        return translate(context).other;
    }
  }
}
