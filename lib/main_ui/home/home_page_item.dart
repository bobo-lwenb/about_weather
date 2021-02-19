import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

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
    Widget location = Positioned(
      top: 30,
      child: _buildLocation(widget.location),
    );
    Widget scrollView = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
        SliverToBoxAdapter(
          child: SignBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: TFBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: FifteenBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: AQIBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: LiveIndexBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: AlertBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: LimitBanner(location: widget.location),
        ),
        SliverToBoxAdapter(
          child: EpidemicBanner(location: widget.location),
        ),
      ],
    );
    return Stack(
      children: <Widget>[
        scrollView,
        location,
      ],
    );
  }

  Widget _buildLocation(Location location) {
    DateTime dateTime = DateTime.now();
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "${dateTime.month}月${dateTime.day}日 ${getWeekDesc(dateTime.weekday)}",
            style: TextStyle(fontSize: 14)),
        Row(children: <Widget>[
          Icon(Icons.location_on_outlined, size: 14),
          SizedBox(width: 4),
          Text("${location.city} ${location.district}",
              style: TextStyle(fontSize: 32)),
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
