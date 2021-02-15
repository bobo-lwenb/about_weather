import 'package:flutter/material.dart';

class AlertBanner extends StatefulWidget {
  @override
  _AlertBannerState createState() => _AlertBannerState();
}

class _AlertBannerState extends State<AlertBanner> {
  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AlertItem();
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
      },
      itemCount: 1,
    );
    Widget widget = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: listView,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("天气预警"),
        ),
        widget,
        Divider(height: 1),
      ],
    );
  }
}

class AlertItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title = Row(
      children: <Widget>[
        Expanded(child: Text("北京市气象台发布大风蓝色预警")),
        Text("蓝色"),
        SizedBox(width: 4),
        Text("大风"),
      ],
    );
    Widget tiem = Text(
      "2021-02-15 16:30:00",
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
    Widget content = Text("预计，16日06时至22时，本市大部分地区有4级左右偏北风，阵风可达7级以上，请注意防范。");
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        SizedBox(height: 4),
        tiem,
        SizedBox(height: 4),
        content,
      ],
    );
    return Padding(
      padding: EdgeInsets.all(16),
      child: column,
    );
  }
}
