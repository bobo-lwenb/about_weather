import 'package:flutter/material.dart';

class ThemeBundle {
  static final light = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.deepOrangeAccent[400],
  );

  static final dark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    accentColor: Colors.deepOrangeAccent,
  );
}
