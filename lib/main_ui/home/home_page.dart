import 'dart:ui';

import 'package:about_weather/city_list/city_list.dart';
import 'package:about_weather/location/location_amap.dart';
import 'package:about_weather/location/provider/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/provider/background_path.dart';
import 'package:about_weather/main_ui/home/provider/current_indext.dart';
import 'package:about_weather/main_ui/home/home_page_item.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
import 'package:about_weather/main_ui/home/provider/refresh_page.dart';
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
  late PageController _pageController;
  int _current = 0;
  bool _isJump = false;
  SettingsPreferences _preferences = SettingsPreferences();
  DateTime _lastUpdateTime = DateTime.now();

  late LocationAmap _locationAmap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    _locationAmap = LocationAmap.init((location) {
      if (location.province == null || location.province!.isEmpty) return;
      _preferences.getLocationList().then((list) {
        if (list.isNotEmpty) list.removeAt(0);
        list.insert(0, location);
        Provider.of<LocationList>(context, listen: false).updateLocation(list);
      });
    });
    _locationAmap.startLocation();

    _pageController = PageController(
      initialPage: _current,
      viewportFraction: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget consumer = Consumer<LocationList>(
      builder: (context, data, child) {
        List<Location> list = data.list;
        if (list.isEmpty) return Container();
        ModelStatus.instance().init(list.length, _current);
        if (_current > list.length - 1) _current = list.length - 1;

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
            if (_isJump) {
              _isJump = false;
              return;
            }
            _current = index;
            _updatePages(_current);
          },
        );
        Widget background =
            Consumer<BackgrounPath>(builder: (context, path, child) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: SizedBox.expand(
                key: ValueKey(path.bgPath),
                child: path.bgPath.isEmpty
                    ? Container(color: Colors.white)
                    : Image.asset("${path.bgPath}", fit: BoxFit.cover),
              ));
        });
        Widget opacityLayer = AnimatedOpacity(
          opacity: isDark(context) ? 0.6 : 0.4,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.black,
          ),
        );
        Widget bottom = Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildBottom(list.length),
        );
        return Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            background,
            opacityLayer,
            pageView,
            bottom,
          ],
        );
      },
    );
    return Scaffold(
      body: consumer,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _locationAmap.dispose();
    _pageController.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (DateTime.now().difference(_lastUpdateTime) >
            Duration(minutes: 15)) {
          Provider.of<RefreshPage>(context, listen: false).refresh();
        }
        break;
      case AppLifecycleState.paused:
        _lastUpdateTime = DateTime.now();
        break;
      default:
    }
  }

  void _updatePages(int index) {
    Provider.of<CurrentIndex>(context, listen: false).updateIndex(index);
    PageStatus status = ModelStatus.instance().setPageStatuByIndex(index);
    if (status.path!.isEmpty) return;
    Provider.of<BackgrounPath>(context, listen: false).changePath(status.path!);
  }

  Widget _buildBottom(int length) {
    Widget time = Positioned(
      left: 0,
      child: _buildTime(),
    );
    Widget cityList = Positioned(
      right: 0,
      child: _buildListCity(),
    );
    Widget indicator = Positioned(
      child: _buildIndicator(length),
    );
    Widget stack = Stack(
      alignment: AlignmentDirectional.center,
      children: [
        time,
        length > 1 ? indicator : SizedBox(),
        cityList,
      ],
    );
    Widget container = Container(
      height: 80,
      color: Colors.black54,
      child: stack,
    );
    return container;
  }

  Widget _buildIndicator(int length) {
    Widget widget = Consumer<CurrentIndex>(
      builder: (context, value, child) {
        int current = value.index;
        List<Widget> list = List.generate(length, (index) {
          return index == 0
              ? Icon(
                  Icons.near_me_sharp,
                  size: 10,
                  color:
                      current == 0 ? Colors.deepOrangeAccent : Colors.grey[400],
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: current == index
                        ? Colors.deepOrangeAccent
                        : Colors.grey[400],
                  ),
                );
        });
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list,
        );
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget,
    );
  }

  Widget _buildListCity() {
    Widget listCity = IconButton(
      icon: Icon(Icons.list_rounded, color: textColor),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CityListPage();
        })).then((index) {
          if (index == null) return;
          _isJump = true;
          _current = index;
          _updatePages(index);
          _pageController.jumpToPage(_current);
        });
      },
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: listCity,
    );
  }

  Widget _buildTime() {
    DateTime dateTime = DateTime.now();
    Widget time = Text(
      "${dateTime.month}???${dateTime.day}??? ${getWeekDesc(dateTime.weekday)}",
      style: TextStyle(fontSize: 14, color: textColor),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: time,
    );
  }
}
