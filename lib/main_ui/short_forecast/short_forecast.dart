import 'package:flutter/material.dart';

class ShortForecastBanner extends StatefulWidget {
  @override
  _ShortForecastBannerState createState() => _ShortForecastBannerState();
}

class _ShortForecastBannerState extends State<ShortForecastBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "未来一小时不会下雨。",
            style: TextStyle(fontSize: 28),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}
