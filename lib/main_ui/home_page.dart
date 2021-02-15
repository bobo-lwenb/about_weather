import 'dart:convert';
import 'dart:developer';

import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/amap_location.dart';
import 'package:about_weather/location/location_data.dart';
import 'package:about_weather/main_ui/alert_banner/alert_banner.dart';
import 'package:about_weather/main_ui/aqi_banner/aqi_banner.dart';
import 'package:about_weather/main_ui/fifteen_banner/fifteen_banner.dart';
import 'package:about_weather/main_ui/limit_banner/limit_banner.dart';
import 'package:about_weather/main_ui/live_index/live_index_banner.dart';
import 'package:about_weather/main_ui/short_forecast/short_forecast.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/tf_banner/tf_banner.dart';
import 'package:about_weather/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AMapLocation _aMapLocation;

  @override
  void initState() {
    super.initState();
    _setAMapLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _aMapLocation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Consumer<LocationData>(
                  builder: (context, data, child) {
                    log(json.encode(data.location));
                    return SignBanner(
                      location: data,
                      key: UniqueKey(),
                    );
                  },
                ),
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
          ),
          Positioned(
            top: 30,
            child: _buildLocation(),
          ),
          Positioned(
            right: 0,
            top: 30,
            child: _buildSettings(),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("2月11日 周四", style: TextStyle(fontSize: 14, color: Colors.grey)),
        Row(children: <Widget>[
          Icon(Icons.location_on_outlined, size: 14),
          SizedBox(width: 4),
          Text("柳州 柳北", style: TextStyle(fontSize: 32)),
        ]),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(16),
      child: column,
    );
  }

  Widget _buildSettings() {
    Widget button = IconButton(
      icon: Icon(Icons.settings_outlined),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SettingPage();
        }));
      },
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: button,
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

  void _setAMapLocation() {
    _aMapLocation = AMapLocation(
      locationChange: (location) {
        if (location.province == null || location.province.isEmpty) return;
        Provider.of<LocationData>(context, listen: false)
            .updateLocation(location);
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
