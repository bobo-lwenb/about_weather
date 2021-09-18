import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/sfc.dart';

class ShortForecastBanner extends StatefulWidget {
  final SFC sfc;

  ShortForecastBanner({Key? key, required this.sfc}) : super(key: key);

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
        isPadding: true,
        child: Row(
          children: [
            Icon(
              Icons.turned_in_not_outlined,
              size: 18,
              color: textColor,
            ),
            SizedBox(width: 8),
            Text("$banner",
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                )),
          ],
        ),
      ),
    );
  }
}
