import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/location.dart';

class LocationList with ChangeNotifier, DiagnosticableTreeMixin {
  List<Location> list;

  LocationList({required this.list});

  List<Location> get locationList => list;

  void updateLocation(List<Location> location) {
    list = location;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("location list", json.encode(list)));
  }
}
