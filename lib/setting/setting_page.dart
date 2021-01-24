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
        title: Text("设置"),
      ),
      body: Column(
        children: [
          ItemTile(
            leading: Icon(Icons.wb_sunny_rounded),
            leadingTitle: Text("深色模式"),
          ),
        ],
      ),
    );
  }
}
