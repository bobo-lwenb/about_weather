import 'package:flutter/material.dart';

AQIDescModel aqiDesc(String number) {
  AQIDescModel model;
  if (number == null || number.isEmpty) {
    model = AQIDescModel();
    return model;
  }
  int value = int.parse(number);
  if (0 <= value && value <= 50) {
    model = AQIDescModel(desc: "优", color: Colors.green);
    return model;
  } else if (51 <= value && value < 100) {
    model = AQIDescModel(desc: "良", color: Colors.yellow);
    return model;
  } else if (101 <= value && value < 150) {
    model = AQIDescModel(desc: "轻度污染", color: Colors.orange);
    return model;
  } else if (151 <= value && value < 200) {
    model = AQIDescModel(desc: "中度污染", color: Colors.red);
    return model;
  } else if (201 <= value && value < 300) {
    model = AQIDescModel(desc: "重度污染", color: Colors.purple);
    return model;
  } else if (301 <= value && value < 500) {
    model = AQIDescModel(desc: "严重污染", color: Colors.brown);
    return model;
  } else if (501 <= value && value < 100000) {
    model = AQIDescModel(desc: "污染爆表", color: Colors.black);
    return model;
  } else {
    model = AQIDescModel();
    return model;
  }
}

class AQIDescModel {
  String desc;
  Color color;

  AQIDescModel({
    this.desc = "",
    this.color = Colors.white,
  });
}

String dayDesc(String weekday, int index) {
  if (index == 0) {
    return "昨天";
  }
  if (index == 1) {
    return "今天";
  }
  if (index == 2) {
    return "明天";
  }
  return weekday;
}

String iconPath(String icon) => "lib/images/W$icon.png";

Widget get white24Divider => Divider(height: 1, color: Colors.white30);
