import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

class WeatherInfoBanner extends StatefulWidget {
  final Condition condition;
  final SignMode signMode;

  const WeatherInfoBanner({
    Key? key,
    required this.condition,
    this.signMode = SignMode.normal,
  }) : super(key: key);

  @override
  _WeatherInfoBannerState createState() => _WeatherInfoBannerState();
}

class _WeatherInfoBannerState extends State<WeatherInfoBanner> {
  @override
  Widget build(BuildContext context) {
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text("天气信息",
              style: TextStyle(
                fontSize: 24,
                color: widget.signMode == SignMode.normal ? textColor : null,
              )),
        ),
        _buildGrid(),
      ],
    );
    return RRectangleBorder(
      mode: widget.signMode,
      isPadding: true,
      child: column,
    );
  }

  Widget _buildGrid() {
    String sunRise = formatHmm(widget.condition.sunRise!);
    String sunSet = formatHmm(widget.condition.sunSet!);
    String humidity = widget.condition.humidity!;
    String realFeel = widget.condition.realFeel!;
    String pressure = widget.condition.pressure!;
    String uvi = widget.condition.uvi!;
    String vis = widget.condition.vis!;
    String windDir = widget.condition.windDir!;
    String windSpeed = widget.condition.windSpeed!;
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
          top: "风向 米/秒",
          title: "$windDir $windSpeed",
          signmode: widget.signMode,
        )),
      ],
    );
    return Column(
      children: <Widget>[
        opacityWidget(object: widget.condition, child: row1),
        white30Divider,
        opacityWidget(object: widget.condition, child: row2),
        white30Divider,
        opacityWidget(object: widget.condition, child: row3),
        white30Divider,
        opacityWidget(object: widget.condition, child: row4),
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

  Item({
    required this.top,
    required this.title,
    required this.signmode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
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
