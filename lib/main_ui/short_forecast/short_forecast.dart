import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/sfc.dart';

class ShortForecastBanner extends StatefulWidget {
  final Location location;
  final SignMode signMode;

  ShortForecastBanner({
    Key key,
    this.location,
    this.signMode = SignMode.normal,
  }) : super(key: key);

  @override
  _ShortForecastBannerState createState() => _ShortForecastBannerState();
}

class _ShortForecastBannerState extends State<ShortForecastBanner> {
  SFC _sfc;

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .shortForecast(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((data) {
      _sfc = data;
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String banner = getField(_sfc?.banner);
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: opacityWidget(
        object: _sfc,
        child: Text("$banner",
            style: TextStyle(
              fontSize: 22,
              color: adaptColor(textColor),
            )),
      ),
    );
  }

  Color adaptColor(Color color) =>
      widget.signMode == SignMode.normal ? color : null;
}
