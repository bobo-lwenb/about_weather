import 'package:about_weather/location/provider/location_list.dart';
import 'package:about_weather/main_ui/home/provider/background_path.dart';
import 'package:about_weather/main_ui/home/provider/current_indext.dart';
import 'package:about_weather/main_ui/home/provider/refresh_page.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'main_ui/home/home_page.dart';
import 'setting/theme/theme_provider.dart';
import 'setting/theme/theme_bundle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  statusbarDarkColor();
  final SettingsPreferences _sp = SettingsPreferences();
  Future.wait(
    [_sp.getThemeMode(), _sp.getLocale()],
  ).then((listValue) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeValues>(
            create: (context) => ThemeValues(mode: listValue[0] as ThemeMode),
          ),
          ChangeNotifierProvider<Language>(
            create: (context) => Language(localeData: listValue[1] as Locale),
          ),
          ChangeNotifierProvider<LocationList>(
            create: (context) => LocationList(list: []),
          ),
          ChangeNotifierProvider<RefreshPage>(
            create: (context) => RefreshPage(),
          ),
          ChangeNotifierProvider<CurrentIndex>(
            create: (context) => CurrentIndex(indexValue: 0),
          ),
          ChangeNotifierProvider<BackgrounPath>(
            create: (context) => BackgrounPath(path: ''),
          )
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: Provider.of<ThemeValues>(context).themeMode,
      theme: ThemeBundle.light,
      darkTheme: ThemeBundle.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Provider.of<Language>(context).locale.languageCode == 'und'
          ? null
          : Provider.of<Language>(context).locale,
      home: HomePage(),
    );
  }
}
