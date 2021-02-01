import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/fields.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:about_weather/setting/theme/theme_provider.dart';
import 'package:about_weather/widgets/item_tile.dart';
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

  @override
  Widget build(BuildContext context) {
    _locale = Provider.of<Language>(context).locale;
    _current = LANGUAGE.indexOf(_locale);
    _languageTitle = languageTitle(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
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
                  print(locale);
                  Provider.of<Language>(context, listen: false)
                      .changeLanuage(locale);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
