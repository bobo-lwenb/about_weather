import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/round_rectangle_border.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/sfc.dart';

class ShortForecastBanner extends StatefulWidget {
  final Location location;
  final SignMode signMode;

  ShortForecastBanner({
    Key? key,
    required this.location,
    this.signMode = SignMode.normal,
  }) : super(key: key);

  @override
  _ShortForecastBannerState createState() => _ShortForecastBannerState();
}

class _ShortForecastBannerState extends State<ShortForecastBanner> {
  SFC? _sfc;

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
    if (_sfc == null) return SizedBox(height: 40);
    String banner = _sfc!.banner;
    return opacityWidget(
      object: _sfc,
      child: RRectangleBorder(
        mode: widget.signMode,
        isPadding: true,
        child: Row(
          children: [
            Icon(
              Icons.turned_in_not_outlined,
              size: 18,
              color: adaptColor(textColor),
            ),
            SizedBox(width: 8),
            Text("$banner",
                style: TextStyle(
                  fontSize: 18,
                  color: adaptColor(textColor),
                )),
          ],
        ),
      ),
    );
  }

  Color? adaptColor(Color color) =>
      widget.signMode == SignMode.normal ? color : null;
}
