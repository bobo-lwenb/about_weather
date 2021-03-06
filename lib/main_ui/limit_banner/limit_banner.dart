import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:flutter/material.dart';

import 'model/limit.dart';

class LimitBanner extends StatefulWidget {
  final List<Limit?>? limits;

  LimitBanner({Key? key, required this.limits}) : super(key: key);

  @override
  _LimitBannerState createState() => _LimitBannerState();
}

class _LimitBannerState extends State<LimitBanner> {
  @override
  Widget build(BuildContext context) {
    if (widget.limits == null || widget.limits!.isEmpty) return Container();
    Widget listView = Container(
      height: 60,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Limititem(limit: widget.limits![index]!);
        },
        itemCount: widget.limits!.length,
      ),
    );
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: Text("本地限行",
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              )),
        ),
        listView,
      ],
    );
    return RRectangleBorder(child: column);
  }
}

class Limititem extends StatelessWidget {
  final Limit limit;

  Limititem({required this.limit});

  @override
  Widget build(BuildContext context) {
    String date = formatMd(limit.date);
    String prompt = limit.prompt;
    Widget column = Container(
      child: Column(
        children: <Widget>[
          Text("$date", style: TextStyle(color: subtextColor)),
          SizedBox(height: 8),
          Text("$prompt", style: TextStyle(color: textColor)),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: column,
    );
  }
}
