import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:flutter/material.dart';

import 'model/forecast_aqi.dart';

class AQIBanner extends StatefulWidget {
  final Location location;

  AQIBanner({this.location, Key key}) : super(key: key);

  @override
  _AQIBannerState createState() => _AQIBannerState();
}

class _AQIBannerState extends State<AQIBanner> {
  List<ForecastAQI> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .aqiForecast5(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((list) {
      _list.clear();
      _list.addAll(list);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) return Container(height: 108);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("5日空气质量预报"),
        ),
        Container(
          height: 108,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AQIItem(forecastAQI: _list[index]);
            },
            itemCount: _list.length,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class AQIItem extends StatelessWidget {
  final ForecastAQI forecastAQI;

  AQIItem({this.forecastAQI});

  @override
  Widget build(BuildContext context) {
    int value = forecastAQI.value;
    String weekday = formatWeekday(forecastAQI.date);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("$value"),
          SizedBox(height: 8),
          Text("良"),
          SizedBox(height: 8),
          Text("$weekday"),
        ],
      ),
    );
  }
}
