import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
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
        return AlertItem();
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
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
          child: Text("天气预警"),
        ),
        widget,
        Divider(height: 1),
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
    Widget title = Row(
      children: <Widget>[
        Expanded(child: Text("$titleString")),
        Text("$level"),
        SizedBox(width: 4),
        Text("$name"),
      ],
    );
    Widget tiem = Text(
      "$pubTime",
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
    Widget content = Text("$contentString");
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
