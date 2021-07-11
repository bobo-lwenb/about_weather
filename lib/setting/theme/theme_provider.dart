import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeValues with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode mode = ThemeMode.system;

  ThemeValues({required this.mode});

  ThemeMode get themeMode => mode;

  void changeThemeMode(ThemeMode value) {
    mode = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("_themeMode", mode.index));
  }
}
