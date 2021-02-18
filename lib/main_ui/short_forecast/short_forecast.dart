import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/sfc.dart';

class ShortForecastBanner extends StatefulWidget {
  final Location location;

  ShortForecastBanner({this.location, Key key}) : super(key: key);

  @override
  _ShortForecastBannerState createState() => _ShortForecastBannerState();
}

class _ShortForecastBannerState extends State<ShortForecastBanner> {
  SFC _sfc;

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .shortForecast(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((data) {
      _sfc = data;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String banner = getField(_sfc?.banner);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "$banner",
            style: TextStyle(fontSize: 28),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}
