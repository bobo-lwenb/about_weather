import 'package:about_weather/city_list/model/city_model.dart';
import 'package:about_weather/city_search/city_search_page.dart';
import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/location/provider/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
import 'package:about_weather/setting/setting_page.dart';
import 'package:about_weather/tool_box/fields.dart';
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
  final SettingsPreferences _preferences = SettingsPreferences();
  final ValueNotifier _notifier =
      ValueNotifier<List<Location>>(List<Location>());

  @override
  void dispose() {
    super.dispose();
    statusbarDarkColor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locations = Provider.of<LocationList>(context).locationList;
    _notifier.value = _locations;
  }

  @override
  Widget build(BuildContext context) {
    Widget valueListenableBuilder = ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, value, child) {
        if (value.length == 0) return SizedBox();
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Location location = _locations[index];
            return InkWell(
              child: Dismissible(
                key: ObjectKey(location),
                background: index == 0
                    ? Container(color: Colors.white)
                    : Container(color: Colors.redAccent),
                confirmDismiss: (direction) async {
                  if (index == 0) return false;
                  return true;
                },
                onDismissed: (direction) {
                  _locations.removeAt(index);
                  _preferences.setLocationList(_locations);
                  Provider.of<LocationList>(context, listen: false)
                      .updateLocation(_locations);

                  ModelStatus.instance().deleteByIndex(index);
                },
                child: ListItem(
                  key: ValueKey(index),
                  location: location,
                  index: index,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(index);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          },
          itemCount: _locations.length,
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(AppLocalizations.of(context).cityList),
        actions: [
          IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              })
        ],
      ),
      body: valueListenableBuilder,
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

class ListItem extends StatefulWidget {
  final Location location;
  final int index;

  ListItem({Key key, this.location, this.index}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final ValueNotifier _valueNotifier = ValueNotifier<CityModel>(CityModel());

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .condition(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((condition) {
      CityModel cityModel = CityModel();
      cityModel.temperature = condition.temp;
      String city = widget.index == 0
          ? "${widget.location.city}"
          : "${widget.location.city}市";
      String district = widget.index == 0
          ? "${widget.location.district}"
          : "${widget.location.district}区";
      cityModel.name = "$city $district";
      cityModel.top =
          widget.index == 0 ? AppLocalizations.of(context).currentLocation : "";
      cityModel.icon = iconPath(condition.icon);
      _valueNotifier.value = cityModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget valueListenableBuilder = ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, value, child) {
        if (value.icon == null) return SizedBox();
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${value.top}",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "${value.name}",
                      style: TextStyle(fontSize: 28),
                    ),
                  ]),
            ),
            Text(
              "${value.temperature}°",
              style: TextStyle(fontSize: 44),
            ),
            SizedBox(width: 8),
            Image.asset(value.icon, width: 24),
          ]),
        );
      },
    );
    return valueListenableBuilder;
  }
}
