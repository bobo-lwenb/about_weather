import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/background_path.dart';
import 'package:about_weather/main_ui/home/model_status.dart';
import 'package:about_weather/main_ui/short_forecast/short_forecast.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/fields_bg.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignBanner extends StatefulWidget {
  final Location location;
  final SignMode signMode;
  final int index;

  SignBanner({
    Key key,
    this.location,
    this.signMode = SignMode.normal,
    this.index,
  }) : super(key: key);

  @override
  _SignBannerState createState() => _SignBannerState();
}

class _SignBannerState extends State<SignBanner> {
  Condition _condition;
  AQIIndex _aqiIndex;

  @override
  void initState() {
    super.initState();
    Location _location = widget.location;
    if (_location == null) return;
    List<Future> list = [
      MojiDio.instance().condition(
        _location.latitude.toString(),
        _location.longitude.toString(),
      ),
      MojiDio.instance().aqiIndex(
        _location.latitude.toString(),
        _location.longitude.toString(),
      ),
    ];
    Future.wait(list).then((listValues) {
      _condition = listValues[0];
      if (widget.signMode == SignMode.normal && context != null) {
        PageStatus status = ModelStatus.instance().getPageStatu(widget.index);
        String path = adaptConditionId(_condition.conditionId, _condition.icon);
        status.path = path;
        ModelStatus.instance().setPageStatu(status);
        if (status.isShow)
          Provider.of<BackgrounPath>(context, listen: false).changePath(path);
      }
      _aqiIndex = listValues[1];
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String temp = getField(_condition?.temp);
    String condition = _condition?.condition;
    String icon = _condition?.icon;
    String tips = _condition?.tips;
    Widget top = Container(
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: 55,
            child: Text(
              "$temp°",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w200,
                color: adaptColor(textColor),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Row(children: [
              Text("$condition",
                  style: TextStyle(
                    fontSize: 22,
                    color: adaptColor(textColor),
                  )),
              SizedBox(width: 8),
              icon != null
                  ? Image.asset(iconPath(icon), width: 20)
                  : Container(),
            ]),
          ),
          Positioned(
            bottom: 20,
            child: Text("$tips",
                style: TextStyle(
                  color: adaptColor(textColor),
                )),
          ),
        ],
      ),
    );
    Widget list = Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAQI(),
          white24Divider,
          _buildGrid(),
        ],
      ),
    );
    return Column(
      children: [
        opacityWidget(object: _condition, child: top),
        ShortForecastBanner(
          location: widget.location,
          signMode: widget.signMode,
        ),
        white24Divider,
        list,
        white24Divider,
      ],
    );
  }

  Color adaptColor(Color color) =>
      widget.signMode == SignMode.normal ? color : null;

  Widget _buildAQI() {
    String value = _aqiIndex?.value;
    String desc = apiDesc(value);
    String pubTime = formatDateFromSection(_aqiIndex?.pubtime);
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "空气质量",
          style: TextStyle(color: adaptColor(subtextColor)),
        ),
        SizedBox(height: 3),
        Text(
          "$value $desc",
          style: TextStyle(fontSize: 32, color: adaptColor(textColor)),
        ),
        SizedBox(height: 3),
        Text(
          "上次更新：$pubTime",
          style: TextStyle(color: adaptColor(subtextColor)),
        ),
      ],
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: opacityWidget(object: _aqiIndex, child: column),
    );
  }

  Widget _buildGrid() {
    String sunRise = formatHmm(getField(_condition?.sunRise));
    String sunSet = formatHmm(getField(_condition?.sunSet));
    String humidity = getField(_condition?.humidity);
    String realFeel = getField(_condition?.realFeel);
    String pressure = getField(_condition?.pressure);
    String uvi = getField(_condition?.uvi);
    String vis = getField(_condition?.vis);
    String windDir = getField(_condition?.windDir);
    String windSpeed = getField(_condition?.windSpeed);
    Widget row1 = Row(
      children: <Widget>[
        Expanded(
            child: Item(
          top: "日出",
          title: "$sunRise",
          signmode: widget.signMode,
        )),
        Expanded(
            child: Item(
          top: "日落",
          title: "$sunSet",
          signmode: widget.signMode,
        )),
      ],
    );
    Widget row2 = Row(
      children: <Widget>[
        Expanded(
            child: Item(
          top: "湿度",
          title: "$humidity%",
          signmode: widget.signMode,
        )),
        Expanded(
            child: Item(
          top: "体感温度",
          title: "$realFeel°",
          signmode: widget.signMode,
        )),
      ],
    );
    Widget row3 = Row(
      children: <Widget>[
        Expanded(
            child: Item(
          top: "气压",
          title: "$pressure百帕",
          signmode: widget.signMode,
        )),
        Expanded(
            child: Item(
          top: "紫外线指数",
          title: "$uvi",
          signmode: widget.signMode,
        )),
      ],
    );
    Widget row4 = Row(
      children: <Widget>[
        Expanded(
            child: Item(
          top: "能见度",
          title: "${_convertMeter(vis)}",
          signmode: widget.signMode,
        )),
        Expanded(
            child: Item(
          top: "风 米/秒",
          title: "$windDir $windSpeed",
          signmode: widget.signMode,
        )),
      ],
    );
    return Column(
      children: <Widget>[
        opacityWidget(object: _condition, child: row1),
        white24Divider,
        opacityWidget(object: _condition, child: row2),
        white24Divider,
        opacityWidget(object: _condition, child: row3),
        white24Divider,
        opacityWidget(object: _condition, child: row4),
      ],
    );
  }

  String _convertMeter(String meter) {
    if (meter.isEmpty) return "";
    int value = int.parse(meter);
    if (0 < value && value < 500) return "$meter 米";
    double result = value / 1000;
    String data = result.toStringAsFixed(1);
    List<String> list = data.split(".");
    if (list[1] == "0") return "${list[0]} 公里";
    return "$data 公里";
  }
}

class Item extends StatelessWidget {
  final String top;
  final String title;
  final SignMode signmode;

  Item({this.top, this.title, this.signmode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$top",
              style: TextStyle(
                  color: signmode == SignMode.normal ? subtextColor : null)),
          Text(
            "$title",
            style: TextStyle(
                fontSize: 32,
                color: signmode == SignMode.normal ? textColor : null),
          ),
        ],
      ),
    );
  }
}
