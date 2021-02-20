import 'package:about_weather/city_list/model/city_model.dart';
import 'package:about_weather/city_search/city_search_page.dart';
import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/location/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<Location> _locations;
  List<CityModel> _listModel = List.empty(growable: true);
  List<Future> futures = List.empty(growable: true);
  SettingsPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _preferences = SettingsPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locations = Provider.of<LocationList>(context).list;
    futures.clear();
    _locations.forEach((location) {
      Future future = MojiDio.instance().condition(
        location.latitude.toString(),
        location.longitude.toString(),
      );
      futures.add(future);
    });
    _listModel.clear();
    Future.wait(futures).then((list) {
      list.asMap().forEach((key, element) {
        Condition condition = element as Condition;
        CityModel cityModel = CityModel();
        cityModel.temperature = condition.temp;
        cityModel.name = "${_locations[key].city} ${_locations[key].district}";
        if (key == 0)
          cityModel.top = "当前位置";
        else
          cityModel.top = "";
        cityModel.icon = iconPath(condition.icon);
        _listModel.add(cityModel);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("位置"),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          CityModel cityModel = _listModel[index];
          return InkWell(
            child: Dismissible(
              key: ValueKey(index),
              background: Container(color: Colors.redAccent),
              onDismissed: (direction) {
                _listModel.removeAt(index);
                _locations.removeAt(index);
                _preferences.setLocationList(_locations);
                Provider.of<LocationList>(context, listen: false)
                    .updateLocation(_locations);
              },
              child: ListItem(cityModel: cityModel),
            ),
            onTap: () {
              Navigator.of(context).pop(index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
        itemCount: _listModel.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CitySearchPage();
          }));
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final CityModel cityModel;

  ListItem({this.cityModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${cityModel.top}",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "${cityModel.name}",
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          Text(
            "${cityModel.temperature}°",
            style: TextStyle(fontSize: 44),
          ),
          SizedBox(width: 8),
          Image.asset(cityModel.icon, width: 24),
        ],
      ),
    );
  }
}
