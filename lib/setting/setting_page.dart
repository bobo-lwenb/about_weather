import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/widgets/item_tile.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Column(
        children: [
          ItemTile(
            leading: Icon(Icons.wb_sunny_rounded),
            leadingTitle: Text(AppLocalizations.of(context).darkMode),
          ),
          ItemTile(
            leading: Icon(Icons.language_rounded),
            leadingTitle: Text(AppLocalizations.of(context).language),
          ),
        ],
      ),
    );
  }
}
