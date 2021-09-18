import 'package:flutter/material.dart';

import '../model/city_info.dart';

class SearchItem extends StatelessWidget {
  final CityInfo info;

  SearchItem({required this.info});

  @override
  Widget build(BuildContext context) {
    Widget row1 = Row(
      children: <Widget>[
        Text(_translate(info.c7)),
        SizedBox(width: 8),
        Text(_translate(info.c5)),
        Offstage(
          offstage: info.c10 == "2",
          child: SizedBox(width: 8),
        ),
        Offstage(
          offstage: info.c10 == "2",
          child: Text(_translate(info.c3)),
        ),
      ],
    );
    Widget row2 = Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.grey),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text("邮编：${_translate(info.c12)}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )),
          SizedBox(width: 8),
          Text("海拔：${_translate(info.c15)}米",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )),
        ],
      ),
    );
    Widget column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        row1,
        SizedBox(height: 2),
        row2,
      ],
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 55,
      child: column,
    );
  }

  String _translate(String value) {
    if (value.isEmpty) {
      return "--";
    }
    return value;
  }
}
