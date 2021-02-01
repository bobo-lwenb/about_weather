import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/setting/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'location/amap_location.dart';
import 'setting/theme/theme_provider.dart';
import 'setting/setting_page.dart';
import 'setting/theme/theme_bundle.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeValues>(
          create: (context) => ThemeValues(),
        ),
        ChangeNotifierProvider<Language>(
          create: (context) => Language(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AMapLocation _aMapLocation;

  @override
  void initState() {
    _setAMapLocation();
    super.initState();
  }

  @override
  void dispose() {
    _aMapLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Weather"),
        actions: [
          Listener(
            onPointerDown: (event) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
            child: Icon(Icons.settings),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _setAMapLocation() {
    AMapLocation.initAMapLocationKey();
    _aMapLocation = AMapLocation(
      locationChange: (result) {
        print(result.district);
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
