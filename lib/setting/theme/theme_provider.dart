import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeValues with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("_themeMode", _themeMode.index));
  }
}
