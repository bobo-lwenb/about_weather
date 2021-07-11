import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

import 'model/limit.dart';

class LimitBanner extends StatefulWidget {
  final Location location;

  LimitBanner({Key? key, required this.location}) : super(key: key);

  @override
  _LimitBannerState createState() => _LimitBannerState();
}

class _LimitBannerState extends State<LimitBanner> {
  final List<Limit?> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .limit(
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
    Widget listView = Container(
      height: 60,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Limititem(limit: _list[index]!);
        },
        itemCount: _list.length,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: Text("本地限行",
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              )),
        ),
        listView,
        white30Divider,
      ],
    );
  }
}

class Limititem extends StatelessWidget {
  final Limit limit;

  Limititem({required this.limit});

  @override
  Widget build(BuildContext context) {
    String date = formatMd(limit.date);
    String prompt = limit.prompt;
    Widget column = Container(
      child: Column(
        children: <Widget>[
          Text("$date", style: TextStyle(color: subtextColor)),
          SizedBox(height: 8),
          Text("$prompt", style: TextStyle(color: textColor)),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: column,
    );
  }
}
