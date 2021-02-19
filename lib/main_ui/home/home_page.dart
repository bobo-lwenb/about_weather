import 'package:about_weather/city_list/city_list.dart';
import 'package:about_weather/location/amap_location.dart';
import 'package:about_weather/location/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/home_page_item.dart';
import 'package:about_weather/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AMapLocation _aMapLocation;
  PageController _pageController;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _setAMapLocation();
    _pageController = PageController(
      initialPage: _current,
      viewportFraction: 1.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _aMapLocation.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget consumer = Consumer<LocationList>(
      builder: (context, data, child) {
        List<Location> list = data.list;
        if (list == null) return Container();
        Widget pageView = PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          itemCount: list.length,
          itemBuilder: (context, index) {
            Location location = list[index];
            return HomePageItem(
              key: ObjectKey(location),
              location: location,
            );
          },
          onPageChanged: (index) {
            _current = index;
            setState(() {});
          },
        );
        Widget settings = Positioned(
          right: 0,
          top: 30,
          child: _buildSettings(),
        );
        return Stack(
          children: <Widget>[
            pageView,
            settings,
          ],
        );
      },
    );
    return Scaffold(
      body: consumer,
    );
  }

  Widget _buildSettings() {
    Widget settings = IconButton(
      icon: Icon(Icons.settings_outlined),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SettingPage();
        }));
      },
    );
    Widget search = IconButton(
      icon: Icon(Icons.list_alt_rounded),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CityListPage();
        }));
      },
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: <Widget>[
          settings,
          search,
        ],
      ),
    );
  }

  void _setAMapLocation() {
    _aMapLocation = AMapLocation(
      locationChange: (location) {
        if (location.province == null || location.province.isEmpty) return;
        List<Location> list = [location];
        Provider.of<LocationList>(context, listen: false).updateLocation(list);
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
