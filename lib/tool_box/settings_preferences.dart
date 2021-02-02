import 'package:about_weather/setting/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const THEME_KEY = "theme_mode";
const LOCALE_KEY = "locale_mode";

class SettingsPreferences {
  BuildContext context;

  SettingsPreferences({this.context});

  void setThemeMode(ThemeMode mode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print("setThemeMode-${mode.index}");
    await sp.setInt(THEME_KEY, mode.index);
  }

  Future<ThemeMode> getThemeMode() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int mode = sp.getInt(THEME_KEY) ?? 0;
    print("getThemeMode-$mode");
    return ThemeMode.values[mode];
  }

  void setLocale(Locale locale) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int value = LANGUAGE.indexOf(locale);
    print("setLocale-$value");
    await sp.setInt(LOCALE_KEY, value);
  }

  Future<Locale> getLocale() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int value = sp.getInt(LOCALE_KEY) ?? 0;
    print("getLocale-$value");
    return LANGUAGE[value];
  }
}
