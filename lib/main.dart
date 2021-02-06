import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'main_ui/home_page.dart';
import 'setting/theme/theme_provider.dart';
import 'setting/theme/theme_bundle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final SettingsPreferences _sp = SettingsPreferences();
  Future.wait(
    [_sp.getThemeMode(), _sp.getLocale()],
  ).then((listValue) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeValues>(
            create: (context) => ThemeValues(mode: listValue[0]),
          ),
          ChangeNotifierProvider<Language>(
            create: (context) => Language(localeData: listValue[1]),
          ),
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CN'),
      ],
      locale: Provider.of<Language>(context).locale,
      home: HomePage(),
    );
  }
}
