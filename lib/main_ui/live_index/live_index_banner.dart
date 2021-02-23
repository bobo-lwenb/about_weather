import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

import 'model/live_index.dart';

class LiveIndexBanner extends StatefulWidget {
  final Location location;

  LiveIndexBanner({this.location, Key key}) : super(key: key);

  @override
  _LiveIndexBannerState createState() => _LiveIndexBannerState();
}

class _LiveIndexBannerState extends State<LiveIndexBanner> {
  List<LiveIndex> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .liveIndex(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((list) {
      _list.clear();
      _list.addAll(list);
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LiveItem(index: _list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return white24Divider;
      },
      itemCount: _list.length,
    );
    Widget widget = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: listView,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("生活指数", style: TextStyle(fontSize: 24, color: textColor)),
        ),
        widget,
        white24Divider,
      ],
    );
  }
}

class LiveItem extends StatelessWidget {
  final LiveIndex index;

  LiveItem({this.index});

  @override
  Widget build(BuildContext context) {
    String desc = index.desc;
    String status = index.status;
    String name = index.name;
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$name: $status", style: TextStyle(color: textColor)),
        SizedBox(height: 3),
        Text(
          "$desc",
          style: TextStyle(
            color: subtextColor,
            fontSize: 14,
          ),
        ),
      ],
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: column,
    );
  }
}
