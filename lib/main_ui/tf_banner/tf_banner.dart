import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:flutter/material.dart';

import 'model/hourly.dart';

class TFBanner extends StatefulWidget {
  final Location location;

  TFBanner({this.location, Key key}) : super(key: key);

  @override
  _TFBannerState createState() => _TFBannerState();
}

class _TFBannerState extends State<TFBanner> {
  List<Hourly> _hourly = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .forecast24(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((list) {
      _hourly.clear();
      _hourly.addAll(list);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hourly.isEmpty) return Container(height: 166);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("24小时天气预报"),
        ),
        Container(
          height: 166,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TFItem(hourly: _hourly[index]);
            },
            itemCount: _hourly.length,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class TFItem extends StatelessWidget {
  final Hourly hourly;

  TFItem({
    this.hourly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("${hourly.hour}时"),
          SizedBox(height: 8),
          Icon(Icons.wb_sunny_rounded),
          SizedBox(height: 8),
          Text("${hourly.condition}"),
          SizedBox(height: 8),
          Text("${hourly.pop}%", style: TextStyle(color: Colors.blue)),
          SizedBox(height: 8),
          Text("${hourly.temp}°"),
        ],
      ),
    );
  }
}
