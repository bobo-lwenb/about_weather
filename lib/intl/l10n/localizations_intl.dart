import 'package:about_weather/intl/l10n_generated/generated_messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_bool) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get darkMode =>
      Intl.message("Dark Model", name: "darkMode", desc: "Dark Mode settings");

  String get language =>
      Intl.message("Language", name: "language", desc: "language settings");

  String get settings =>
      Intl.message("Settings", name: "settings", desc: "settings");

  String get todayInHistory => Intl.message("Today in History",
      name: "todayInHistory", desc: "today in History");

  String get todayInHistoryDesc =>
      Intl.message("Show the events that happened today in history",
          name: "todayInHistoryDesc",
          desc: "Show the events that happened today in history");

  String get aboutApp =>
      Intl.message("About App", name: "aboutApp", desc: "About App");

  String get welcome =>
      Intl.message("Welcome", name: "welcome", desc: "welcome");

  String get developer => Intl.message("Developer: liu wenbo",
      name: "developer", desc: "developer name");
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "zh"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) => false;
}