import 'package:flutter/material.dart';

class TFBanner extends StatefulWidget {
  @override
  _TFBannerState createState() => _TFBannerState();
}

class _TFBannerState extends State<TFBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("24小时天气预报"),
        ),
        Container(
          height: 166,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TFItem();
            },
            itemCount: 24,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}

class TFItem extends StatelessWidget {
  final String hour;
  final String condition;
  final String icon;
  final String pop;
  final String temp;

  TFItem({
    this.hour,
    this.condition,
    this.icon,
    this.pop,
    this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("16时"),
          SizedBox(height: 8),
          Icon(Icons.wb_sunny_rounded),
          SizedBox(height: 8),
          Text("晴"),
          SizedBox(height: 8),
          Text("50%", style: TextStyle(color: Colors.blue)),
          SizedBox(height: 8),
          Text("16°"),
        ],
      ),
    );
  }
}
