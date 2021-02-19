import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/hourly.dart';

class TFBanner extends StatefulWidget {
  final Location location;

  TFBanner({this.location, Key key}) : super(key: key);

  @override
  _TFBannerState createState() => _TFBannerState();
}

class _TFBannerState extends State<TFBanner> {
  List<Hourly> _hourly = List.empty(growable: true);
  String riseSun = "";
  String setSun = "";

  @override
  void initState() {
    super.initState();
    Future contidion = MojiDio.instance().condition(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    );
    Future forecast = MojiDio.instance().forecast24(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    );
    Future.wait([contidion, forecast]).then((list) {
      riseSun = (list[0] as Condition).sunRise;
      setSun = (list[0] as Condition).sunSet;
      _hourly.clear();
      _hourly.addAll(list[1]);
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
              Hourly hourly = _hourly[index];
              bool isday = isDay(hourly.hour, riseSun, setSun);
              return TFItem(hourly: hourly, isDay: isday);
            },
            itemCount: _hourly.length,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }

  bool isDay(String hour, String riseSun, String setSun) {
    int intHour = int.parse(hour);

    DateFormat dateFormat = DateFormat("HH");

    DateTime dateTime = DateTime.parse(riseSun);
    String riseHour = dateFormat.format(dateTime);
    int intRiseSun = int.parse(riseHour);

    dateTime = DateTime.parse(setSun);
    String setHour = dateFormat.format(dateTime);
    int intSetSun = int.parse(setHour);

    if (intHour > intRiseSun && intHour <= intSetSun) {
      return true;
    } else {
      return false;
    }
  }
}

class TFItem extends StatelessWidget {
  final Hourly hourly;
  final bool isDay;

  TFItem({this.hourly, this.isDay = true});

  @override
  Widget build(BuildContext context) {
    String path = isDay ? iconPath(hourly.iconDay) : iconPath(hourly.iconNight);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("${hourly.hour}时"),
          SizedBox(height: 8),
          Image.asset(path, width: 14),
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
