import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:flutter/material.dart';

class SignBanner extends StatefulWidget {
  final Location location;

  SignBanner({this.location, Key key}) : super(key: key);

  @override
  _SignBannerState createState() => _SignBannerState();
}

class _SignBannerState extends State<SignBanner> {
  Condition _condition;
  AQIIndex _aqiIndex;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Positioned(
                bottom: 95,
                child: Text(
                  "16°",
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.w200),
                ),
              ),
              Positioned(
                bottom: 80,
                child: Text("晴"),
              ),
              Positioned(
                bottom: 60,
                child: Text("冷热适宜，感觉很舒适。"),
              ),
            ],
          ),
        ),
        Divider(height: 1),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildAQI(),
              Divider(height: 1),
              _buildGrid(),
            ],
          ),
        ),
        Divider(height: 1),
      ],
    );
  }

  void initData() {
    Location _location = widget.location;
    if (_location == null) return;
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
      _aqiIndex = listValues[1];
      setState(() {});
    });
  }

  Widget _buildAQI() {
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "空气质量",
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          "123-轻度污染",
          style: TextStyle(fontSize: 32),
        ),
        Text(
          "上次更新：1小时内",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: column,
    );
  }

  Widget _buildGrid() {
    Widget row1 = Row(
      children: <Widget>[
        Expanded(child: Item(top: "日出", title: "5:46")),
        Expanded(child: Item(top: "日落", title: "18:45"))
      ],
    );
    Widget row2 = Row(
      children: <Widget>[
        Expanded(child: Item(top: "湿度", title: "42%")),
        Expanded(child: Item(top: "体感温度", title: "15°"))
      ],
    );
    Widget row3 = Row(
      children: <Widget>[
        Expanded(child: Item(top: "气压", title: "999百帕")),
        Expanded(child: Item(top: "紫外线指数", title: "0"))
      ],
    );
    Widget row4 = Row(
      children: <Widget>[
        Expanded(child: Item(top: "能见度", title: "1200米")),
        Expanded(child: Item(top: "风 米/秒", title: "西南风 99.7"))
      ],
    );
    return Column(
      children: <Widget>[
        row1,
        Divider(height: 1),
        row2,
        Divider(height: 1),
        row3,
        Divider(height: 1),
        row4,
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String top;
  final String title;

  Item({
    this.top,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$top",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
