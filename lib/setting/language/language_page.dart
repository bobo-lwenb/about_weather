import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/widgets/item_tile.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Locale _locale;
  int _current;
  List<String> _languageTitle;
  SettingsPreferences _sp;

  @override
  void initState() {
    _sp = SettingsPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _locale = Provider.of<Language>(context).locale;
    _current = LANGUAGE.indexOf(_locale);
    _languageTitle = languageTitle(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(AppLocalizations.of(context).language),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _languageTitle.length,
            itemBuilder: (context, index) {
              return ItemTile(
                leadingTitle: Text("${_languageTitle[index]}"),
                trailing: Offstage(
                  offstage: _current != index,
                  child: Icon(Icons.done_rounded),
                ),
                onTap: () {
                  Locale locale = LANGUAGE[index];
                  Provider.of<Language>(context, listen: false)
                      .changeLanguage(locale);
                  _sp.setLocale(locale);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
