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
