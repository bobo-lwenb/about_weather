import 'dart:convert';

import 'package:about_weather/epidemic/widgets/banner/epidemic_banner.dart';
import 'package:about_weather/location/amap_location.dart';
import 'package:about_weather/location/location_data.dart';
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
      appBar: AppBar(
        title: Text("About Weather"),
        actions: [
          Listener(
            onPointerDown: (event) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
            child: Icon(Icons.settings),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              borderRadius: BorderRadius.circular(10),
            ),
            child: EpidemicBanner(),
          ),
        ),
      ],
    );
  }

  void _setAMapLocation() {
    _aMapLocation = AMapLocation(
      locationChange: (location) {
        print(json.encode(location));
        if (location.province == null || location.province.isEmpty) return;
        Provider.of<LocationData>(context, listen: false)
            .updateLocation(location);
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
