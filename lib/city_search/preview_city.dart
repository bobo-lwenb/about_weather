import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/location/provider/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/main_ui/weatherinfo_banner/weatherinfo_banner.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// lat = 15.917, lon = 114.483
class PreviewCity extends StatefulWidget {
  final Location location;

  PreviewCity({this.location});

  @override
  _PreviewCityState createState() => _PreviewCityState();
}

class _PreviewCityState extends State<PreviewCity> {
  List<Location> _list;
  SettingsPreferences _preferences;
  bool isadd = true;

  @override
  void initState() {
    super.initState();
    _preferences = SettingsPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _list = Provider.of<LocationList>(context, listen: false).locationList;
    _list.forEach((element) {
      if (element.province == widget.location.province &&
          element.city == widget.location.city &&
          element.district == widget.location.district) {
        isadd = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Location location = widget.location;
    String city = location.city;
    String district = getField(location.district);
    Widget row = Row(
      children: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context).cancel),
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
          child: Text(AppLocalizations.of(context).add),
          onPressed: () {
            if (isadd) {
              _list.add(widget.location);
              _preferences.setLocationList(_list);
              Provider.of<LocationList>(context, listen: false)
                  .updateLocation(_list);

              PageStatus status = PageStatus(
                index: _list.length,
                isShow: false,
                path: "",
              );
              ModelStatus.instance().addPageStatu(status);
            }
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: 40),
            SignBanner(
              location: widget.location,
              signMode: SignMode.preview,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: black12Divider,
            ),
            WeatherInfoBanner(
              location: widget.location,
              signMode: SignMode.preview,
            ),
          ]),
        ),
        row,
      ],
    );
  }
}
