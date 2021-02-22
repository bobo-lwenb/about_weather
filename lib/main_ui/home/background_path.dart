import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackgrounPath with ChangeNotifier, DiagnosticableTreeMixin {
  String path = "";

  BackgrounPath({this.path});

  String get bgPath => path;

  void changePath(String pathString) {
    path = pathString;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("path", path));
  }
}
