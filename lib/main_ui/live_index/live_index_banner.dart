import 'package:flutter/material.dart';

class LiveIndexBanner extends StatefulWidget {
  @override
  _LiveIndexBannerState createState() => _LiveIndexBannerState();
}

class _LiveIndexBannerState extends State<LiveIndexBanner> {
  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LiveItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1);
      },
      itemCount: 11,
    );
    Widget widget = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: listView,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("生活指数"),
        ),
        widget,
        Divider(height: 1),
      ],
    );
  }
}

class LiveItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("旅游指数: 一般"),
        Text(
          "天气较好，温度稍低，而且风稍大，让您感觉有些冷，会对外出有一定影响，外出注意防风保暖。",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: column,
    );
  }
}
