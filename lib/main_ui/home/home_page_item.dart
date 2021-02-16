import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/short_forecast/short_forecast.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:flutter/material.dart';

class HomePageItem extends StatefulWidget {
  final Location location;

  HomePageItem({this.location, Key key}) : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
        SliverToBoxAdapter(
          child: SignBanner(location: widget.location, key: UniqueKey()),
        ),
        SliverToBoxAdapter(
          child: ShortForecastBanner(),
        ),
        SliverToBoxAdapter(
          child: TFBanner(),
        ),
        SliverToBoxAdapter(
          child: FifteenBanner(),
        ),
        SliverToBoxAdapter(
          child: AQIBanner(),
        ),
        SliverToBoxAdapter(
          child: LiveIndexBanner(),
        ),
        SliverToBoxAdapter(
          child: AlertBanner(),
        ),
        SliverToBoxAdapter(
          child: LimitBanner(),
        ),
        SliverToBoxAdapter(
          child: _buildEpidemicBanner(),
        ),
      ],
    );
  }

  Widget _buildEpidemicBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: EpidemicBanner(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
