import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const LANGUAGE = <Locale>[
  const Locale.fromSubtags(),
  const Locale('zh', 'CN'),
  const Locale('en', 'US'),
];

class Language with ChangeNotifier, DiagnosticableTreeMixin {
  Locale localeData = LANGUAGE[0];

  Language({required this.localeData});
  Locale get locale => localeData;

  void changeLanguage(Locale value) {
    localeData = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("_locale", localeData.toString()));
  }
}
