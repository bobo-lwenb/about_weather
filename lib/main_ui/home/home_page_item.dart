import 'dart:ui';

import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/home/home_view_model.dart';
import 'package:about_weather/main_ui/home/provider/refresh_page.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:about_weather/main_ui/weatherinfo_banner/weatherinfo_banner.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePageItem extends StatefulWidget {
  final Location location;
  final int index;

  HomePageItem({Key? key, required this.location, required this.index})
      : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem>
    with AutomaticKeepAliveClientMixin {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(
      lat: widget.location.latitude!,
      lon: widget.location.longitude!,
    );
    _homeViewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<RefreshPage>(builder: (context, value, child) {
      ValueListenableBuilder builder = ValueListenableBuilder(
        valueListenable: _homeViewModel.valueNotifier,
        builder: (context, homeModel, child) {
          if (!homeModel.isInit) return SizedBox();
          Widget scrollView = CustomScrollView(
            key: ValueKey(value.number),
            physics: BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(widget.location, widget.index),
              SliverToBoxAdapter(
                child: SignBanner(
                  condition: homeModel.condition,
                  sfc: homeModel.sfc,
                  aqiIndex: homeModel.aqi,
                  hourly: homeModel.hourly,
                  index: widget.index,
                ),
              ),
              SliverToBoxAdapter(
                child: TFBanner(
                  condition: homeModel.condition,
                  hourly: homeModel.hourly,
                ),
              ),
              SliverToBoxAdapter(
                  child: FifteenBanner(list: homeModel.forecast)),
              SliverToBoxAdapter(child: AQIBanner(list: homeModel.aqiForecast)),
              SliverToBoxAdapter(
                  child: WeatherInfoBanner(condition: homeModel.condition)),
              SliverToBoxAdapter(
                  child: LiveIndexBanner(list: homeModel.liveList)),
              SliverToBoxAdapter(child: AlertBanner(alerts: homeModel.alert)),
              SliverToBoxAdapter(child: LimitBanner(limits: homeModel.limit)),
              SliverToBoxAdapter(
                child: EpidemicBanner(
                  location: widget.location,
                  internalData: homeModel.internalData,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
          return scrollView;
        },
      );
      return builder;
    });
  }

  Widget _buildAppBar(Location location, int index) {
    String city = index == 0 ? location.city! : "${location.city}市";
    Widget flexibleBanner = Container(
      alignment: Alignment.center,
      child: Text(
        "$city",
        style: TextStyle(fontSize: 45, color: textColor),
      ),
    );

    String district = index == 0 ? location.district! : "${location.district}区";
    Widget districtTitle = Text(
      "$district",
      style: TextStyle(
          fontSize: 30, color: textColor, fontWeight: FontWeight.normal),
    );
    Widget sliverAppBar = SliverAppBar(
      pinned: true,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight: 160,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        double sigma = constraints.biggest.height == 100 ? 25 : 0;
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
