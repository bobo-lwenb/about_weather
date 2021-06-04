import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/fifteen_banner/model/forecast.dart';
import 'package:about_weather/tool_box/fields.dart';
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
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) return Container(height: 243);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("15日天气预报",
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              )),
        ),
        Container(
          height: 259,
          child: ListView.builder(
            itemExtent: 80,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FifteenItem(forecast: _list[index], index: index);
            },
            itemCount: _list.length,
          ),
        ),
        white24Divider,
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
    String weekday = dayDesc(formatWeekday(forecast.predictDate), index);
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
          Text("$weekday", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$date", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$pop%", style: TextStyle(color: Colors.lightBlue)),
          SizedBox(height: 4),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white70),
            ),
            child: Column(
              children: [
                Image.asset(iconPath(forecast.conditionIdDay), width: 20),
                SizedBox(height: 8),
                Text("$condotionDay", style: TextStyle(color: textColor)),
                SizedBox(height: 8),
                Text("$tempDay°", style: TextStyle(color: textColor)),
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black87),
            ),
            child: Column(
              children: [
                Text("$tempNight°", style: TextStyle(color: textColor)),
                SizedBox(height: 8),
                Image.asset(iconPath(forecast.conditionIdNight), width: 20),
                SizedBox(height: 8),
                Text("$conditionNight", style: TextStyle(color: textColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
