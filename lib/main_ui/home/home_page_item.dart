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

import 'background_path.dart';

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
    return ChangeNotifierProvider<BackgrounPath>(
      create: (context) => BackgrounPath(),
      child: Consumer<RefreshPage>(builder: (context, value, child) {
        Widget stack = Stack(key: ValueKey(value.number), children: <Widget>[
          Positioned.fill(
            child: Consumer<BackgrounPath>(builder: (context, path, child) {
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox.expand(
                    key: ValueKey(path.bgPath),
                    child: path.bgPath == null || path.bgPath.isEmpty
                        ? Container(color: Colors.white)
                        : Image.asset("${path.bgPath}", fit: BoxFit.cover),
                  ));
            }),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isDark(context) ? 0.5 : 0.25,
              duration: const Duration(milliseconds: 1000),
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          _buildScrollView(widget.location),
          Positioned(
            top: 30,
            child: _buildLocation(widget.location, widget.index),
          ),
        ]);
        return stack;
      }),
    );
  }

  Widget _buildScrollView(Location location) {
    Widget scrollView = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
        SliverToBoxAdapter(
          child: SignBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: TFBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: FifteenBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: AQIBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: LiveIndexBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: AlertBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: LimitBanner(location: location),
        ),
        SliverToBoxAdapter(
          child: EpidemicBanner(location: location),
        ),
      ],
    );
    return scrollView;
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
