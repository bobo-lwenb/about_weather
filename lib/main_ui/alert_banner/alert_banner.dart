import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

import 'model/alert.dart';

class AlertBanner extends StatefulWidget {
  final List<Alert?>? alerts;

  AlertBanner({Key? key, required this.alerts}) : super(key: key);

  @override
  _AlertBannerState createState() => _AlertBannerState();
}

class _AlertBannerState extends State<AlertBanner> {
  @override
  Widget build(BuildContext context) {
    if (widget.alerts == null || widget.alerts!.isEmpty) return Container();
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AlertItem(alert: widget.alerts![index]!);
      },
      separatorBuilder: (context, index) {
        return white30Divider;
      },
      itemCount: widget.alerts!.length,
    );
    Widget listWrapper = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: listView,
    );
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("天气预警", style: TextStyle(fontSize: 24, color: textColor)),
        ),
        listWrapper,
      ],
    );
    return RRectangleBorder(child: column);
  }
}

class AlertItem extends StatelessWidget {
  final Alert alert;

  AlertItem({required this.alert});

  @override
  Widget build(BuildContext context) {
    String titleString = alert.title;
    String level = alert.level;
    String name = alert.name;
    String pubTime = alert.pubTime;
    String contentString = alert.content;
    Widget title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$titleString", style: TextStyle(color: textColor)),
        Row(
          children: <Widget>[
            Text("$level", style: TextStyle(color: textColor)),
            SizedBox(width: 4),
            Text("$name", style: TextStyle(color: textColor)),
          ],
        ),
      ],
    );
    Widget tiem = Text(
      "$pubTime",
      style: TextStyle(color: subtextColor, fontSize: 12),
    );
    Widget content = Text("$contentString", style: TextStyle(color: textColor));
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        SizedBox(height: 4),
        tiem,
        SizedBox(height: 4),
        content,
      ],
    );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: column,
    );
  }
}
