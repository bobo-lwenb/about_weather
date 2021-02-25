import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

import 'model/alert.dart';

class AlertBanner extends StatefulWidget {
  final Location location;

  AlertBanner({this.location, Key key}) : super(key: key);

  @override
  _AlertBannerState createState() => _AlertBannerState();
}

class _AlertBannerState extends State<AlertBanner> {
  List<Alert> _list = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .alert(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((list) {
      if (list == null) return;
      _list.clear();
      _list.addAll(list);
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) return Container();
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AlertItem(alert: _list[index]);
      },
      separatorBuilder: (context, index) {
        return white24Divider;
      },
      itemCount: _list.length,
    );
    Widget widget = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: listView,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("天气预警", style: TextStyle(fontSize: 24, color: textColor)),
        ),
        widget,
        white24Divider,
      ],
    );
  }
}

class AlertItem extends StatelessWidget {
  final Alert alert;

  AlertItem({this.alert});

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
      padding: EdgeInsets.all(16),
      child: column,
    );
  }
}
