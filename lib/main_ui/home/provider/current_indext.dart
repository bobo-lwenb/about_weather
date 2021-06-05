import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentIndex with ChangeNotifier, DiagnosticableTreeMixin {
  int indexValue = 0;

  CurrentIndex({this.indexValue});

  int get index => indexValue;

  void updateIndex(int value) {
    indexValue = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("index", indexValue));
  }
}
