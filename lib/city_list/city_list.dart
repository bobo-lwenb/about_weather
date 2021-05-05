import 'package:about_weather/city_list/model/city_model.dart';
import 'package:about_weather/city_search/city_search_page.dart';
import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/location/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/model_status.dart';
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
  SettingsPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _preferences = SettingsPreferences();
  }

  @override
  void dispose() {
    super.dispose();
    statusbarDarkColor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locations = Provider.of<LocationList>(context).locationList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).cityList),
      ),
      body: ListView.separated(
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

class ListItem extends StatefulWidget {
  final Location location;
  final int index;

  ListItem({Key key, this.location, this.index}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  CityModel cityModel;

  @override
  void initState() {
    super.initState();
    MojiDio.instance()
        .condition(
      widget.location.latitude.toString(),
      widget.location.longitude.toString(),
    )
        .then((condition) {
      cityModel = CityModel();
      cityModel.temperature = condition.temp;
      cityModel.name = "${widget.location.city} ${widget.location.district}";
      if (widget.index == 0)
        cityModel.top = AppLocalizations.of(context).currentLocation;
      else
        cityModel.top = "";
      cityModel.icon = iconPath(condition.icon);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cityModel == null) return Container();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${cityModel?.top}",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "${cityModel?.name}",
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          Text(
            "${cityModel?.temperature}°",
            style: TextStyle(fontSize: 44),
          ),
          SizedBox(width: 8),
          Image.asset(cityModel?.icon, width: 24),
        ],
      ),
    );
  }
}
