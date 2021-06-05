import 'dart:ui';

import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/home/provider/refresh_page.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:about_weather/main_ui/weatherinfo_banner/weatherinfo_banner.dart';
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
          _buildAppBar(widget.location, widget.index),
          SliverToBoxAdapter(
            child: SignBanner(location: widget.location, index: widget.index),
          ),
          SliverToBoxAdapter(child: TFBanner(location: widget.location)),
          SliverToBoxAdapter(child: FifteenBanner(location: widget.location)),
          SliverToBoxAdapter(child: AQIBanner(location: widget.location)),
          SliverToBoxAdapter(
              child: WeatherInfoBanner(location: widget.location)),
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

  Widget _buildAppBar(Location location, int index) {
    String city = index == 0 ? location.city : "${location.city}市";
    Widget flexibleBanner = Container(
      alignment: Alignment.center,
      child: Text(
        "$city",
        style: TextStyle(fontSize: 45, color: textColor),
      ),
    );

    String district = index == 0 ? location.district : "${location.district}区";
    Widget districtTitle = Text(
      "$district",
      style: TextStyle(
          fontSize: 30, color: textColor, fontWeight: FontWeight.normal),
    );
    Widget sliverAppBar = SliverAppBar(
      brightness: Brightness.dark,
      pinned: true,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight: 160,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        double sigma = constraints.biggest.height == 100 ? 15 : 0;
        return ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: flexibleBanner,
                  title: districtTitle,
                )));
      }),
    );
    return sliverAppBar;
  }

  @override
  bool get wantKeepAlive => true;
}
