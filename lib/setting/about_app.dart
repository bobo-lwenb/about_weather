import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp>
    with SingleTickerProviderStateMixin {
  String _appName = "";
  String _appVersion = "";

  @override
  void initState() {
    super.initState();
    _info();
  }

  @override
  Widget build(BuildContext context) {
    Flex flex = Flex(
      direction: Axis.vertical,
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Text(
          AppLocalizations.of(context)!.welcome,
          style: TextStyle(fontSize: 26),
        ),
        Expanded(flex: 2, child: SizedBox()),
        Text(
          _appName,
          style: TextStyle(fontSize: 42),
        ),
        Expanded(flex: 2, child: SizedBox()),
        Column(
          children: [
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
      ],
    );
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.aboutApp),
        ),
        backgroundColor: Colors.deepOrange[400],
        body: SafeArea(child: flex),
      ),
    );
  }

  void _info() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _appVersion = packageInfo.version;
    setState(() {});
  }
}
