import 'package:flutter/material.dart';

class AQIBanner extends StatefulWidget {
  @override
  _AQIBannerState createState() => _AQIBannerState();
}

class _AQIBannerState extends State<AQIBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("5日空气质量预报"),
        ),
        Container(
          height: 108,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AQIItem();
            },
            itemCount: 7,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class AQIItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("43"),
          SizedBox(height: 8),
          Text("良"),
          SizedBox(height: 8),
          Text("周二"),
        ],
      ),
    );
  }
}
