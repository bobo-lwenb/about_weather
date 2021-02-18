import 'package:about_weather/epidemic/epidemic_page.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/about_app.dart';
import 'package:about_weather/setting/language/language_page.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:about_weather/setting/theme/theme_page.dart';
import 'package:about_weather/setting/theme/theme_provider.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'today_history/today_history_page.dart';
import 'widgets/item_tile.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = Provider.of<ThemeValues>(context).themeMode;
    Locale locale = Provider.of<Language>(context).locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          ItemTile(
            leading: Icon(Icons.wb_sunny_rounded),
            leadingTitle: Text(AppLocalizations.of(context).themeMode),
            trailingTitle: Text(
              themeTitle(context)[mode.index],
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ThemePage();
              }));
            },
          ),
          SizedBox(height: 8),
          ItemTile(
            leading: Icon(Icons.language_rounded),
            leadingTitle: Text(AppLocalizations.of(context).language),
            trailingTitle: Text(
              languageTitle(context)[LANGUAGE.indexOf(locale)],
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LanguagePage();
              }));
            },
          ),
          SizedBox(height: 24),
          ItemTile(
            leading: Icon(Icons.data_usage_rounded),
            leadingTitle: Text(AppLocalizations.of(context).epidemicData),
            subTitle: AppLocalizations.of(context).epidemicDataDesc,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EpidemicPage();
              }));
            },
          ),
          SizedBox(height: 24),
          ItemTile(
            leading: Icon(Icons.history_edu_rounded),
            leadingTitle: Text(AppLocalizations.of(context).todayInHistory),
            subTitle: AppLocalizations.of(context).todayInHistoryDesc,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TodayHistoryPage();
              }));
            },
          ),
          SizedBox(height: 24),
          ItemTile(
            leading: Icon(Icons.info_outline_rounded),
            leadingTitle: Text(AppLocalizations.of(context).aboutApp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AboutApp();
              }));
            },
          ),
        ],
      ),
    );
  }
}
