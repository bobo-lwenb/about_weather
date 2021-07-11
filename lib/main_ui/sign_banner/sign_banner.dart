import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/provider/background_path.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
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
  final int? index;

  SignBanner({
    Key? key,
    required this.location,
    this.signMode = SignMode.normal,
    this.index,
  }) : super(key: key);

  @override
  _SignBannerState createState() => _SignBannerState();
}

class _SignBannerState extends State<SignBanner> {
  Condition? _condition;
  AQIIndex? _aqiIndex;

  @override
  void initState() {
    super.initState();
    Location _location = widget.location;
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
      if (widget.signMode == SignMode.normal) {
        PageStatus status = ModelStatus.instance().getPageStatu(widget.index!);
        String path =
            adaptConditionId(_condition!.conditionId!, _condition!.icon!);
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
    if (_condition == null || _aqiIndex == null) return SizedBox();
    String temp = _condition!.temp!;
    String condition = _condition!.condition!;
    String icon = _condition!.icon!;
    String tips = _condition!.tips!;
    Widget top = Container(
      height: 150,
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
              Image.asset(iconPath(icon), width: 20)
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
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildAQI(),
    );
    return Column(
      children: [
        opacityWidget(object: _condition, child: top),
        ShortForecastBanner(
          location: widget.location,
          signMode: widget.signMode,
        ),
        white30Divider,
        list,
        white30Divider,
      ],
    );
  }

  Color? adaptColor(Color color) =>
      widget.signMode == SignMode.normal ? color : null;

  Widget _buildAQI() {
    String value = _aqiIndex!.value!;
    String desc = aqiDesc(value).desc;
    String pubTime = formatDateFromSection(_aqiIndex!.pubtime!);
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(children: [
          Text(
            "空气质量",
            style: TextStyle(color: adaptColor(subtextColor)),
          ),
          Positioned(
            right: 0,
            child: Text(
              "AQI（CN）",
              style: TextStyle(color: adaptColor(subtextColor)),
            ),
          ),
        ]),
        SizedBox(height: 3),
        Text(
          "$value - $desc",
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: opacityWidget(object: _aqiIndex, child: column),
    );
  }
}
