import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

import 'model/forecast_aqi.dart';

class AQIBanner extends StatefulWidget {
  final Location location;

  AQIBanner({Key? key, required this.location}) : super(key: key);

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
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) return Container(height: 171);
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("5日空气质量预报",
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              )),
        ),
        Container(
          height: 126,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AQIItem(forecastAQI: _list[index], index: index);
            },
            itemCount: _list.length,
          ),
        ),
      ],
    );
    return RRectangleBorder(child: column);
  }
}

class AQIItem extends StatelessWidget {
  final ForecastAQI forecastAQI;
  final int index;

  AQIItem({required this.forecastAQI, required this.index});

  @override
  Widget build(BuildContext context) {
    int value = forecastAQI.value;
    AQIDescModel model = aqiDesc(value.toString());
    String desc = model.desc;
    Color descColor = model.color;
    String weekday = dayDesc(formatWeekday(forecastAQI.date), index);
    String date = formatMd(forecastAQI.date);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("$weekday", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$date", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$value", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: desc.length > 1 ? 6 : 16,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: descColor),
            ),
            child: Text(
              "$desc",
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
