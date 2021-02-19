import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
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
              return AQIItem(forecastAQI: _list[index], index: index);
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
  final int index;

  AQIItem({this.forecastAQI, this.index});

  @override
  Widget build(BuildContext context) {
    int value = forecastAQI.value;
    String desc = apiDesc(value.toString());
    String weekday = getDayDesc(formatWeekday(forecastAQI.date), index);
    String date = formatMd(forecastAQI.date);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("$weekday"),
          SizedBox(height: 8),
          Text("$date"),
          SizedBox(height: 8),
          Text("$value"),
          SizedBox(height: 8),
          Text("$desc"),
        ],
      ),
    );
  }
}
