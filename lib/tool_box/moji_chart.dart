import 'package:flutter/material.dart';

String apiDesc(String number) {
  if (number == null || number.isEmpty) return "";
  int value = int.parse(number);
  if (0 <= value && value <= 50) {
    return "优";
  } else if (51 <= value && value < 100) {
    return "良";
  } else if (101 <= value && value < 150) {
    return "轻度污染";
  } else if (151 <= value && value < 200) {
    return "重度污染";
  } else if (201 <= value && value < 300) {
    return "重度污染";
  } else if (301 <= value && value < 500) {
    return "严重污染";
  } else if (501 <= value && value < 100000) {
    return "空气污染爆表";
  } else {
    return "";
  }
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
