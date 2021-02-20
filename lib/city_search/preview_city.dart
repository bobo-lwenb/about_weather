import 'package:about_weather/location/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewCity extends StatefulWidget {
  final Location location;

  PreviewCity({this.location});

  @override
  _PreviewCityState createState() => _PreviewCityState();
}

class _PreviewCityState extends State<PreviewCity> {
  List<Location> _list;
  SettingsPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _preferences = SettingsPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _list = Provider.of<LocationList>(context, listen: false).list;
    bool flag = true;
    _list.forEach((element) {
      if (element.province == widget.location.province &&
          element.city == widget.location.city &&
          element.district == widget.location.district) {
        flag = false;
      }
    });
    if (flag) {
      _list.add(widget.location);
    }
    _preferences.setLocationList(_list);
  }

  @override
  Widget build(BuildContext context) {
    Location location = widget.location;
    String city = location.city;
    String district = getField(location.district);
    Widget row = Row(
      children: <Widget>[
        TextButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        Expanded(
          child: Text(
            "$city $district",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          child: Text("添加"),
          onPressed: () {
            Provider.of<LocationList>(context, listen: false)
                .updateLocation(_list);
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SignBanner(location: widget.location),
        ),
        row,
      ],
    );
  }
}
