import 'package:about_weather/main_ui/home/provider/background_path.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/main_ui/short_forecast/model/sfc.dart';
import 'package:about_weather/main_ui/short_forecast/short_forecast.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/main_ui/tf_banner/model/hourly.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/fields_bg.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignBanner extends StatefulWidget {
  final Condition condition;
  final SFC sfc;
  final AQIIndex aqiIndex;
  final List<Hourly> hourly;
  final SignMode signMode;
  final int? index;

  SignBanner({
    Key? key,
    required this.condition,
    required this.sfc,
    required this.aqiIndex,
    required this.hourly,
    this.signMode = SignMode.normal,
    this.index,
  }) : super(key: key);

  @override
  _SignBannerState createState() => _SignBannerState();
}

class _SignBannerState extends State<SignBanner> {
  ValueBean? bean;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.signMode == SignMode.normal && mounted) {
        PageStatus status = ModelStatus.instance().getPageStatu(widget.index!);
        String path = adaptConditionId(
            widget.condition.conditionId!, widget.condition.icon!);
        status.path = path;
        ModelStatus.instance().setPageStatu(status);
        if (status.isShow)
          Provider.of<BackgrounPath>(context, listen: false).changePath(path);
      }
    });
    List<int> temps = widget.hourly.map((e) => int.parse(e.temp)).toList();
    bean = minAndMax(temps);
  }

  @override
  Widget build(BuildContext context) {
    String temp = widget.condition.temp!;
    String condition = widget.condition.condition!;
    String icon = widget.condition.icon!;

    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RRectangleBorder(
          mode: widget.signMode,
          isPadding: true,
          halfLeftMargin: true,
          child: Row(
            children: [
              Image.asset(iconPath(icon), width: 16),
              SizedBox(width: 8),
              Text(
                "$condition",
                style: TextStyle(color: adaptColor(textColor)),
              ),
            ],
          ),
        ),
        RRectangleBorder(
          mode: widget.signMode,
          isPadding: true,
          halfLeftMargin: true,
          child: Text("最高${bean!.max}°  最低${bean!.min}°",
              style: TextStyle(
                color: adaptColor(textColor),
              )),
        ),
      ],
    );
    Widget row = Row(
      children: [
        Expanded(
          flex: 1,
          child: RRectangleBorder(
            mode: widget.signMode,
            isPadding: true,
            halfRightMargin: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$temp",
                    style: TextStyle(
                      fontSize: 85,
                      fontWeight: FontWeight.w200,
                      color: adaptColor(textColor),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("°",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w200,
                        color: adaptColor(textColor),
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: column,
        ),
      ],
    );
    Widget aqi = Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RRectangleBorder(
        mode: widget.signMode,
        isPadding: true,
        isMargin: false,
        child: _buildAQI(),
      ),
    );
    return Column(
      children: [
        opacityWidget(object: widget.condition, child: row),
        ShortForecastBanner(
          sfc: widget.sfc,
          signMode: widget.signMode,
        ),
        SizedBox(height: 16),
        aqi,
      ],
    );
  }

  Widget _buildAQI() {
    String value = widget.aqiIndex.value!;
    String desc = aqiDesc(value).desc;
    String pubTime = formatDateFromSection(widget.aqiIndex.pubtime!);
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
    return opacityWidget(object: widget.aqiIndex, child: column);
  }

  Color? adaptColor(Color color) =>
      widget.signMode == SignMode.normal ? color : null;

  ValueBean minAndMax(List<int> hourly) {
    int max = hourly[0];
    int min = hourly[0];
    for (int temp in hourly) {
      if (temp > max) {
        max = temp;
      }
      if (temp < min) {
        min = temp;
      }
    }
    return ValueBean(max: max, min: min);
  }
}

class ValueBean {
  final int max;
  final int min;

  ValueBean({required this.max, required this.min});
}
