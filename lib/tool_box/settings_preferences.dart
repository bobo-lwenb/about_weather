import 'dart:convert';

import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const THEME_KEY = "theme_mode";
const LOCALE_KEY = "locale_mode";
const LOCATION_LIST = "location_list";

class SettingsPreferences {
  BuildContext? context;

  SettingsPreferences({this.context});

  void setThemeMode(ThemeMode mode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setInt(THEME_KEY, mode.index);
  }

  Future<ThemeMode> getThemeMode() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int mode = sp.getInt(THEME_KEY) ?? 0;
    return ThemeMode.values[mode];
  }

  void setLocale(Locale locale) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int value = LANGUAGE.indexOf(locale);
    await sp.setInt(LOCALE_KEY, value);
  }

  Future<Locale> getLocale() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int value = sp.getInt(LOCALE_KEY) ?? 0;
    return LANGUAGE[value];
  }

  void setLocationList(List<Location> list) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(LOCATION_LIST, json.encode(list));
  }

  Future<List<Location>> getLocationList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<Location> locations = List.empty(growable: true);
    String? list = sp.getString(LOCATION_LIST);
    if (list != null) {
      List<dynamic> data = json.decode(list);
      data.forEach((element) {
        Location location = Location.fromJson(element);
        locations.add(location);
      });
    }
    return locations;
  }
}
