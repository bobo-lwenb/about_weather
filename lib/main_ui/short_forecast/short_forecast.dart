import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/sfc.dart';

class ShortForecastBanner extends StatefulWidget {
  final SFC sfc;
  final SignMode signMode;

  ShortForecastBanner({
    Key? key,
    required this.sfc,
    this.signMode = SignMode.normal,
  }) : super(key: key);

  @override
  _ShortForecastBannerState createState() => _ShortForecastBannerState();
}

class _ShortForecastBannerState extends State<ShortForecastBanner> {
  @override
  Widget build(BuildContext context) {
    String banner = widget.sfc.banner!;
    return opacityWidget(
      object: widget.sfc,
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
