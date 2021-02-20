import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:flutter/material.dart';

import 'model/limit.dart';

class LimitBanner extends StatefulWidget {
  final Location location;

  LimitBanner({this.location, Key key}) : super(key: key);

  @override
  _LimitBannerState createState() => _LimitBannerState();
}

class _LimitBannerState extends State<LimitBanner> {
  final List<Limit> _list = List.empty(growable: true);

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
        return Limititem(limit: _list[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
      },
      itemCount: 16,
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
          child: Text("本地限行尾号"),
        ),
        widget,
        Divider(height: 1),
      ],
    );
  }
}

class Limititem extends StatelessWidget {
  final Limit limit;

  Limititem({this.limit});

  @override
  Widget build(BuildContext context) {
    String date = formatMd(limit.date);
    String prompt = limit.prompt;
    Widget column = Container(
      height: 44,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: Text("$date"),
          ),
          Positioned(
            right: 0,
            child: Text("限行 $prompt"),
          ),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: column,
    );
  }
}
