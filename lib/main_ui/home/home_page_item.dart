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
      Widget scrollView = CustomScrollView(
        key: ValueKey(value.number),
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: _buildLocation(widget.location, widget.index),
          ),
          SliverToBoxAdapter(
            child: SignBanner(location: widget.location, index: widget.index),
          ),
          SliverToBoxAdapter(child: TFBanner(location: widget.location)),
          SliverToBoxAdapter(child: FifteenBanner(location: widget.location)),
          SliverToBoxAdapter(child: AQIBanner(location: widget.location)),
          SliverToBoxAdapter(child: LiveIndexBanner(location: widget.location)),
          SliverToBoxAdapter(child: AlertBanner(location: widget.location)),
          SliverToBoxAdapter(child: LimitBanner(location: widget.location)),
          SliverToBoxAdapter(child: EpidemicBanner(location: widget.location)),
          SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      );
      return scrollView;
    });
  }

  Widget _buildLocation(Location location, int index) {
    String city = index == 0 ? location.city : "${location.city}市";
    String district = index == 0 ? location.district : "${location.district}区";
    DateTime dateTime = DateTime.now();
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "${dateTime.month}月${dateTime.day}日 ${getWeekDesc(dateTime.weekday)}",
            style: TextStyle(fontSize: 14, color: textColor)),
        Row(
          children: <Widget>[
            Offstage(
              offstage: index == 0 ? false : true,
              child: Icon(Icons.near_me_sharp, size: 14, color: textColor),
            ),
            SizedBox(width: 4),
            Text("$city $district",
                style: TextStyle(fontSize: 30, color: textColor)),
          ],
        ),
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
