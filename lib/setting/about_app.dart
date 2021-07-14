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

  ValueNotifier _valueNotifier = ValueNotifier<double>(0);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _info();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _controller.addListener(() {
      _valueNotifier.value = (1 - _controller.value) * _valueNotifier.value;
      if (_controller.isCompleted) _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    Column column = Column(
      children: [
        SizedBox(height: 32),
        Text(
          AppLocalizations.of(context)!.welcome,
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 150),
        Text(
          _appName,
          style: TextStyle(fontSize: 42),
        ),
        SizedBox(height: 150),
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
    ValueListenableBuilder builder = ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, value, child) {
        return Positioned(
          top: value as double,
          child: child!,
        );
      },
      child: column,
    );
    GestureDetector detector = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: (details) {
        _valueNotifier.value += details.delta.dy / 2;
      },
      onVerticalDragEnd: (details) {
        _controller.forward();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          builder,
        ],
      ),
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
        body: detector,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _info() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _appVersion = packageInfo.version;
    setState(() {});
  }
}
