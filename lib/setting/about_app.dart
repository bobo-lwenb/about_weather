import 'dart:io';

import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  String _appName = "";
  String _appVersion = "";

  @override
  void initState() {
    info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: isDark(context) ? Colors.grey[850] : Colors.white10,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.welcome,
                style: TextStyle(fontSize: 22)),
            Container(
              height: 255,
              child: Center(
                child: Text(_appName, style: TextStyle(fontSize: 42)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Platform.isAndroid ? "Android Version" : "iOS Version"),
                SizedBox(width: 6),
                Text(_appVersion),
              ],
            ),
            Text(AppLocalizations.of(context)!.developer),
          ],
        ),
      ),
    );
  }

  void info() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _appVersion = packageInfo.version;
    setState(() {});
  }
}
