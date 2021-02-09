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

  String get themeMode =>
      Intl.message("Theme Model", name: "themeMode", desc: "Theme Model");

  String get followSystem => Intl.message("Follow System",
      name: "followSystem", desc: "Follow System");

  String get lightMode =>
      Intl.message("Light Mode", name: "lightMode", desc: "Light Mode");

  String get darkMode =>
      Intl.message("Dark Mode", name: "darkMode", desc: "Dark Mode");

  String get language =>
      Intl.message("Language", name: "language", desc: "language settings");

  String get systemLanguage => Intl.message("System Language",
      name: "systemLanguage", desc: "System Language");

  String get english =>
      Intl.message("English", name: "english", desc: "English");

  String get simplifiedChinese => Intl.message("Simplified Chinese",
      name: "simplifiedChinese", desc: "Simplified Chines");

  String get epidemicData => Intl.message("Epidemic Data",
      name: "epidemicData", desc: "Epidemic Data");

  String get epidemicDataDesc =>
      Intl.message("Contains data on domestic and overseas epidemics",
          name: "epidemicDataDesc",
          desc: "Contains data on domestic and overseas epidemics");

  String get covid_19 =>
      Intl.message("COVID-19", name: "covid_19", desc: "COVID-19");

  String get domesticEpidemic => Intl.message("Domestic Epidemic",
      name: "domesticEpidemic", desc: "Domestic Epidemic");

  String get overseasEpidemic => Intl.message("Overseas Epidemic",
      name: "overseasEpidemic", desc: "Overseas Epidemic");

  String get statisticsCutoff => Intl.message("Statistics Cutoff",
      name: "statisticsCutoff", desc: "Statistics Cutoff");

  String get localExistConfirmed => Intl.message("Local E-C",
      name: "localExistConfirmed", desc: "Local Exist Confirmed");

  String get existConfirmed =>
      Intl.message("E-C", name: "existConfirmed", desc: "Exist Confirmed");

  String get confirmed =>
      Intl.message("Confirmed", name: "confirmed", desc: "Confirmed");

  String get symptomless =>
      Intl.message("Symptomless", name: "symptomless", desc: "Symptomless");

  String get importAbroad => Intl.message("Import Abroad",
      name: "importAbroad", desc: "Import Abroad");

  String get death => Intl.message("Death", name: "death", desc: "Death");

  String get cure => Intl.message("Cure", name: "cure", desc: "Cure");

  String get existSuspect => Intl.message("Exist Suspect",
      name: "existSuspect", desc: "Exist Suspect");

  String get existSevere =>
      Intl.message("Exist Severe", name: "existSevere", desc: "Exist Severe");

  String get fromYesterday => Intl.message("from yesterday",
      name: "fromYesterday", desc: "from yesterday");

  String get chinaEpidemic =>
      Intl.message("China Epidemic (including Hong Kong, Macao and Taiwan)",
          name: "chinaEpidemic",
          desc: "China Epidemic (including Hong Kong, Macao and Taiwan)");

  String get epidemicTip => Intl.message(
      "7:00-10:00 is the peak update period. Please understand if the data lags behind.",
      name: "epidemicTip",
      desc:
          "7:00-10:00 is the peak update period. Please understand if the data lags behind.");

  String get dataSource =>
      Intl.message("Data Source: public data from local health commissions",
          name: "dataSource",
          desc: "Data Source: public data from local health commissions");

  String get area => Intl.message("Area", name: "area", desc: "Area");

  String get ec => Intl.message("E-C", name: "ec", desc: "Exist Confirmed");

  String get localSymptomless => Intl.message("Symptomless",
      name: "localSymptomless", desc: "Local Symptomless");

  String get deathless =>
      Intl.message("death", name: "deathless", desc: "deathless");

  String get detail => Intl.message("Detail", name: "detail", desc: "Detail");

  String get preventionAdvice => Intl.message("COVID-19 Prevention Advice",
      name: "preventionAdvice", desc: "COVID-19 Prevention Advice");

  String get hygiene => Intl.message("Personal Hygiene",
      name: "hygiene", desc: "Personal Hygiene");

  String get hygiene1 => Intl.message(
      "Wash your hands frequently, wash your hands with hand sanitizer and water, rub your hands for at least 20 seconds, and dry them in time.",
      name: "hygiene1",
      desc: "Wash Hand");

  String get hygiene2 => Intl.message(
      "Keep your hands clean, especially before touching your eyes, mouth, nose or ears.",
      name: "hygiene2",
      desc: "Keep your hands clean");

  String get hygiene3 => Intl.message(
      "Cover your mouth and nose with a tissue when you sneeze or cough, then put the tissue in a covered trash can, and wash your hands immediately.",
      name: "hygiene3",
      desc: "Cover your mouth and nose");

  String get hygiene4 => Intl.message("Keep indoor air circulation.",
      name: "hygiene4", desc: "Keep indoor air circulation.");

  String get hygiene5 => Intl.message(
      "If you can bring home items from outside, try to disinfect them with alcohol.",
      name: "hygiene5",
      desc: "If you can bring home items from outside");

  String get avoid =>
      Intl.message("Try to Avoid", name: "avoid", desc: "Try to Avoid");

  String get avoid1 => Intl.message(
      "Avoid going to crowded places. If it is unavoidable, please wear a surgical mask.",
      name: "avoid1",
      desc: "Avoid going to crowded places.");

  String get avoid2 => Intl.message(
      "Pay attention to food safety and hygiene, and avoid eating or drinking raw or undercooked animal food, including meat, eggs, and milk.",
      name: "avoid2",
      desc: "Pay attention to food safety and hygiene");

  String get avoid3 => Intl.message(
      "Avoid wearing the same mask for a long time, and conditions allow changing the mask in due course.",
      name: "avoid3",
      desc: "Avoid wearing the same mask for a long time");

  String get sd => Intl.message("See a doctor as soon as possible",
      name: "sd", desc: "See a doctor as soon as possible");

  String get sd1 => Intl.message(
      "If you feel unwell, especially fever and cough, wear a mask and see a doctor in time.",
      name: "sd1",
      desc: "If you feel unwell");

  String get sd2 =>
      Intl.message("Please maintain social distancing when visiting a doctor.",
          name: "sd2", desc: "maintain social distancing");

  String get sd3 => Intl.message(
      "Wash your hands promptly when you return home after consultation.",
      name: "sd3",
      desc: "Wash your hands promptly");

  String get newCases =>
      Intl.message("New Cases", name: "newCases", desc: "New Cases");

  String get source =>
      Intl.message("Data source: WHO and Hopkins University website",
          name: "source",
          desc: "Data source: WHO and Hopkins University website");

  String get national => Intl.message("National Epidemic Data",
      name: "national", desc: "National Epidemic Data");
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
