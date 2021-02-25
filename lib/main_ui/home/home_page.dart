import 'package:about_weather/city_list/city_list.dart';
import 'package:about_weather/location/amap_location.dart';
import 'package:about_weather/location/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/home_page_item.dart';
import 'package:about_weather/main_ui/home/refresh_page.dart';
import 'package:about_weather/setting/setting_page.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  AMapLocation _aMapLocation;
  PageController _pageController;
  int _current = 0;
  SettingsPreferences _preferences;
  DateTime _lastUpdateTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _preferences = SettingsPreferences();
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
              index: index,
            );
          },
          onPageChanged: (index) {
            _current = index;
            setState(() {});
          },
        );
        Widget settings = Positioned(
          right: 0,
          top: 20,
          child: _buildSettings(),
        );
        Widget indicator = Positioned(
            bottom: 20,
            child: Offstage(
              offstage: list.length == 1 ? true : false,
              child: _buildIndicator(context, list.length),
            ));
        return Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            pageView,
            settings,
            indicator,
          ],
        );
      },
    );
    return Scaffold(
      body: consumer,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (_lastUpdateTime != null &&
            DateTime.now().difference(_lastUpdateTime) > Duration(seconds: 1)) {
          Provider.of<RefreshPage>(context, listen: false).refresh();
        }
        break;
      case AppLifecycleState.paused:
        _lastUpdateTime = DateTime.now();
        break;
      default:
    }
  }

  Widget _buildIndicator(BuildContext context, int length) {
    List<Widget> list = List.generate(length, (index) {
      return index == 0
          ? Icon(
              Icons.near_me_sharp,
              size: 10,
              color: _current == 0 ? Colors.deepOrangeAccent : Colors.grey[400],
            )
          : Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Colors.deepOrangeAccent
                    : Colors.grey[400],
              ),
            );
    });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      ),
    );
  }

  Widget _buildSettings() {
    Widget settings = IconButton(
      icon: Icon(Icons.settings_outlined, color: textColor),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SettingPage();
        }));
      },
    );
    Widget refreshIndicator = CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.white54,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
      strokeWidth: 2,
    );
    Widget listCity = IconButton(
      icon: Icon(Icons.list_alt_rounded, color: textColor),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CityListPage();
        })).then((index) {
          if (index == null) return;
          _current = index;
          _pageController.jumpToPage(_current);
        });
      },
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(children: <Widget>[
            Offstage(
              offstage: true,
              child: SizedBox(width: 16, height: 16, child: refreshIndicator),
            ),
            settings
          ]),
          listCity,
        ],
      ),
    );
  }

  void _setAMapLocation() {
    _aMapLocation = AMapLocation(
      locationChange: (location) {
        if (location.province == null || location.province.isEmpty) return;
        _preferences.getLocationList().then((list) {
          if (list.isNotEmpty) list.removeAt(0);
          list.insert(0, location);
          Provider.of<LocationList>(context, listen: false)
              .updateLocation(list);
        });
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
