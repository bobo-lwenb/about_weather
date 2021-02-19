import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';

List<String> themeTitle(BuildContext context) => [
      AppLocalizations.of(context).followSystem,
      AppLocalizations.of(context).lightMode,
      AppLocalizations.of(context).darkMode,
    ];

List<String> languageTitle(BuildContext context) => [
      AppLocalizations.of(context).systemLanguage,
      AppLocalizations.of(context).simplifiedChinese,
      AppLocalizations.of(context).english,
    ];

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
