import 'package:flutter/material.dart';

class StatisCell extends StatelessWidget {
  final bool isShowChange;
  final int changeCount;
  final int count;
  final String typeName;
  final double countSize;
  final Color color;
  final Color backgroundColor;

  StatisCell({
    this.typeName,
    this.count,
    this.isShowChange = true,
    this.changeCount,
    this.countSize = 30,
    this.color = Colors.blue,
    this.backgroundColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    Widget column = Column(
      children: <Widget>[
        Text(
          "$typeName",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 3),
        Text(
          "$count",
          style: TextStyle(
            color: color,
            fontSize: countSize,
          ),
        ),
        SizedBox(height: 3),
        Opacity(
          opacity: isShowChange ? 1 : 0,
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: "较昨日",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            TextSpan(
              text: _buildString(changeCount),
              style: TextStyle(color: color, fontSize: 14),
            ),
          ])),
        ),
      ],
    );
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: column,
    );
  }

  String _buildString(int change) {
    if (change == null) return "";
    if (change >= 0) {
      return "+${change.abs()}";
    } else if (change < 0) {
      return "-${change.abs()}";
    } else {
      return "$change";
    }
  }
}
