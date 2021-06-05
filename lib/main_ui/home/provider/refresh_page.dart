import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RefreshPage with ChangeNotifier, DiagnosticableTreeMixin {
  int value;

  RefreshPage({this.value = 0});

  int get number => value;

  void refresh() {
    value++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("value", value));
  }
}
