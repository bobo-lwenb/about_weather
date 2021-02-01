import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const LANGUAGE = [
  null,
  const Locale('zh', 'CN'),
  const Locale('en', 'US'),
];

class Language with ChangeNotifier, DiagnosticableTreeMixin {
  Locale _locale;

  Locale get locale => _locale;

  void changeLanuage(Locale value) {
    _locale = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("_locale", _locale.toString()));
  }
}
