import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/home/refresh_page.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageItem extends StatefulWidget {
  final Location location;
  final int index;

  HomePageItem({Key key, this.location, this.index}) : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<RefreshPage>(builder: (context, value, child) {
      Widget stack = Stack(key: ValueKey(value.number), children: <Widget>[
        _buildScrollView(widget.location),
        Positioned(
          top: 30,
          child: _buildLocation(widget.location, widget.index),
        ),
      ]);
      return stack;
    });
  }

  Widget _buildScrollView(Location location) {
    Widget listview = ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 80),
        SignBanner(location: location, index: widget.index),
        TFBanner(location: location),
        FifteenBanner(location: location),
        AQIBanner(location: location),
        LiveIndexBanner(location: location),
        AlertBanner(location: location),
        LimitBanner(location: location),
        EpidemicBanner(location: location),
      ],
    );
    return listview;
  }

  Widget _buildLocation(Location location, int index) {
    DateTime dateTime = DateTime.now();
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "${dateTime.month}月${dateTime.day}日 ${getWeekDesc(dateTime.weekday)}",
            style: TextStyle(fontSize: 14, color: textColor)),
        Row(children: <Widget>[
          Offstage(
            offstage: index == 0 ? false : true,
            child: Icon(Icons.near_me_sharp, size: 14, color: textColor),
          ),
          SizedBox(width: 4),
          Text("${location.city} ${location.district}",
              style: TextStyle(fontSize: 32, color: textColor)),
        ]),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(16),
      child: column,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
