import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

import 'model/live_index.dart';

class LiveIndexBanner extends StatefulWidget {
  final List<LiveIndex> list;

  LiveIndexBanner({Key? key, required this.list}) : super(key: key);

  @override
  _LiveIndexBannerState createState() => _LiveIndexBannerState();
}

class _LiveIndexBannerState extends State<LiveIndexBanner> {
  @override
  Widget build(BuildContext context) {
    Widget gridView = GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return ItemLive(liveIndex: widget.list[index]);
      },
      itemCount: widget.list.length,
    );
    Widget gridWrapper = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: gridView,
    );
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("生活指数", style: TextStyle(fontSize: 24, color: textColor)),
        ),
        gridWrapper,
        SizedBox(height: 8),
      ],
    );
    return RRectangleBorder(child: column);
  }
}

class ItemLive extends StatelessWidget {
  final LiveIndex liveIndex;

  const ItemLive({
    Key? key,
    required this.liveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 150,
                child: Center(
                  child: Text(liveIndex.desc, textAlign: TextAlign.center),
                ),
              ),
            );
          }),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(liveIndex.name, style: TextStyle(color: subtextColor)),
            SizedBox(height: 8),
            Text(
              liveIndex.status,
              style: TextStyle(fontSize: 22, color: textColor),
            ),
            SizedBox(height: 8),
            Icon(getIcon(liveIndex.name), color: textColor),
          ],
        ),
      ),
    );
  }
}
