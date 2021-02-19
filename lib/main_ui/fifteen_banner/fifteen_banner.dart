import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/fifteen_banner/model/forecast.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

class FifteenBanner extends StatefulWidget {
  final Location location;

  FifteenBanner({this.location, Key key}) : super(key: key);

  @override
  _FifteenBannerState createState() => _FifteenBannerState();
}

class _FifteenBannerState extends State<FifteenBanner> {
  List<Forecast> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .forecast15(
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
    if (_list.isEmpty) return Container(height: 275);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("15日天气预报"),
        ),
        Container(
          height: 275,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FifteenItem(forecast: _list[index], index: index);
            },
            itemCount: _list.length,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class FifteenItem extends StatelessWidget {
  final Forecast forecast;
  final int index;

  FifteenItem({this.forecast, this.index});

  @override
  Widget build(BuildContext context) {
    String weekday = getDayDesc(formatWeekday(forecast.predictDate), index);
    String date = formatMd(forecast.predictDate);
    String pop = forecast.pop;
    String condotionDay = forecast.conditionDay;
    String tempDay = forecast.tempDay;
    String tempNight = forecast.tempNight;
    String conditionNight = forecast.conditionNight;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("$weekday"),
          SizedBox(height: 8),
          Text("$date"),
          SizedBox(height: 8),
          Text("$pop%", style: TextStyle(color: Colors.blue)),
          SizedBox(height: 8),
          Image.asset(iconPath(forecast.conditionIdDay), width: 14),
          SizedBox(height: 8),
          Text("$condotionDay"),
          SizedBox(height: 8),
          Text("$tempDay°"),
          SizedBox(height: 4),
          Text("$tempNight°"),
          SizedBox(height: 8),
          Image.asset(iconPath(forecast.conditionIdNight), width: 14),
          SizedBox(height: 8),
          Text("$conditionNight"),
        ],
      ),
    );
  }
}
