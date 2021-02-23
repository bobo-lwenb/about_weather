import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> themeTitle(BuildContext context) => [
      AppLocalizations.of(context).followSystem,
      AppLocalizations.of(context).lightMode,
      AppLocalizations.of(context).darkMode,
    ];

List<String> languageTitle(BuildContext context) => [
      AppLocalizations.of(context).systemLanguage,
      "简体中文",
      "Eglish",
      // AppLocalizations.of(context).simplifiedChinese,
      // AppLocalizations.of(context).english,
    ];

Color get textColor => Color(0xDFFFFFFF);
Color get subtextColor => Colors.white38;

String getWeekDesc(int weekday) {
  String desc;
  switch (weekday) {
    case DateTime.monday:
      desc = "周一";
      break;
    case DateTime.tuesday:
      desc = "周二";
      break;
    case DateTime.wednesday:
      desc = "周三";
      break;
    case DateTime.thursday:
      desc = "周四";
      break;
    case DateTime.friday:
      desc = "周五";
      break;
    case DateTime.saturday:
      desc = "周六";
      break;
    case DateTime.sunday:
      desc = "周日";
      break;
    default:
      desc = "$weekday";
  }
  return desc;
}

String getField(String field) {
  return field == null ? "" : field;
}

Widget opacityWidget({@required dynamic object, @required Widget child}) {
  Widget widget = IgnorePointer(
    ignoring: true,
    child: Opacity(
      opacity: object == null ? 0 : 1,
      child: child,
    ),
  );
  return object == null ? widget : child;
}

void statusbarDarkColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 设置状态栏透明
    statusBarBrightness: Brightness.dark, // 字体为白色
  ));
}

void statusbarLightColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 设置状态栏透明
    statusBarBrightness: Brightness.light, // 字体为黑色
  ));
}

bool isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? true : false;
