import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String titleTop;
  final String title;
  final String temperature;
  final Widget widget;

  ListItem({
    this.titleTop,
    this.title,
    this.temperature,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "我的位置",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "柳州",
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
          Text(
            "16°",
            style: TextStyle(fontSize: 44),
          ),
          SizedBox(width: 4),
          Icon(Icons.wb_sunny_rounded),
        ],
      ),
    );
  }
}
