import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/widgets/item_tile.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/setting/theme/theme_provider.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  ThemeMode _themeMode;
  int _current;
  List<String> _themeTitle;
  SettingsPreferences _sp;

  @override
  void initState() {
    _sp = SettingsPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _themeMode = Provider.of<ThemeValues>(context).themeMode;
    _current = _themeMode.index;
    _themeTitle = themeTitle(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).themeMode),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _themeTitle.length,
            itemBuilder: (context, index) {
              return ItemTile(
                leadingTitle: Text("${_themeTitle[index]}"),
                trailing: Offstage(
                  offstage: _current != index,
                  child: Icon(Icons.done_rounded),
                ),
                onTap: () {
                  ThemeMode mode = ThemeMode.values[index];
                  Provider.of<ThemeValues>(context, listen: false)
                      .changeThemeMode(mode);
                  _sp.setThemeMode(mode);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
