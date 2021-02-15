import 'package:flutter/material.dart';

class LimitBanner extends StatefulWidget {
  @override
  _LimitBannerState createState() => _LimitBannerState();
}

class _LimitBannerState extends State<LimitBanner> {
  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Limititem();
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
      },
      itemCount: 16,
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
          child: Text("本地限行尾号"),
        ),
        widget,
        Divider(height: 1),
      ],
    );
  }
}

class Limititem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget column = Container(
      height: 44,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: Text("02-14"),
          ),
          Positioned(
            right: 0,
            child: Text("限行 21"),
          ),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: column,
    );
  }
}
