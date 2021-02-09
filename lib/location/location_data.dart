import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/location.dart';

class LocationData with ChangeNotifier, DiagnosticableTreeMixin {
  Location model;

  LocationData({this.model});

  Location get location => model;

  void updateLocation(Location location) {
    model = location;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("location", json.encode(model)));
  }
}
