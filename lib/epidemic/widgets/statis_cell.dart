import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';

class StatisCell extends StatelessWidget {
  final bool isShowChange;
  final int changeCount;
  final int count;
  final Color topColor;
  final Color subColor;
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
    this.topColor,
    this.subColor = Colors.grey,
    this.color = Colors.blue,
    this.backgroundColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    Widget column = Column(
      children: <Widget>[
        Text(
          "$typeName",
          style: TextStyle(fontSize: 16, color: topColor),
        ),
        SizedBox(height: 3),
        Text(
          count == null ? "--" : "$count",
          style: TextStyle(
            color: color,
            fontSize: countSize,
          ),
        ),
        SizedBox(height: 3),
        isShowChange
            ? Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                  text: AppLocalizations.of(context).fromYesterday,
                  style: TextStyle(color: subColor, fontSize: 14),
                ),
                TextSpan(
                  text: _buildString(changeCount),
                  style: TextStyle(color: color, fontSize: 14),
                ),
              ]))
            : Text(
                "--",
                style: TextStyle(color: color, fontSize: 14),
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
