import 'package:about_weather/city_search/preview_view_model.dart';
import 'package:about_weather/location/provider/location_list.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/main_ui/home/provider/model_status.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/main_ui/weatherinfo_banner/weatherinfo_banner.dart';
import 'package:about_weather/tool_box/settings_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewCity extends StatefulWidget {
  final Location location;

  PreviewCity({required this.location});

  @override
  _PreviewCityState createState() => _PreviewCityState();
}

class _PreviewCityState extends State<PreviewCity> {
  late PreViewModel _preViewModel;
  late List<Location> _list;
  late SettingsPreferences _preferences;
  bool isadd = true;

  @override
  void initState() {
    super.initState();
    _preferences = SettingsPreferences();
    _preViewModel = PreViewModel(
      lat: widget.location.latitude!,
      lon: widget.location.longitude!,
    );
    _preViewModel.initData();
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
    String city = location.city!;
    String district = location.district!;
    Widget row = Row(
      children: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel),
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
          child: Text(AppLocalizations.of(context)!.add),
          onPressed: () {
            if (isadd) {
              _list.add(widget.location);
              _preferences.setLocationList(_list);
              Provider.of<LocationList>(context, listen: false)
                  .updateLocation(_list);

              PageStatus status = PageStatus(
                index: 0,
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
    ValueListenableBuilder builder = ValueListenableBuilder(
      valueListenable: _preViewModel.valueNotifier,
      builder: (context, preModel, child) {
        if (!preModel.isInit) return SizedBox(height: double.infinity);
        Widget scrollView = SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: 40),
            SignBanner(
              condition: preModel.condition,
              sfc: preModel.sfc,
              aqiIndex: preModel.aqi,
              hourly: preModel.hourly,
              signMode: SignMode.preview,
            ),
            WeatherInfoBanner(
              condition: preModel.condition,
              signMode: SignMode.preview,
            ),
            SizedBox(height: 40),
          ]),
        );
        return Stack(
          children: [
            scrollView,
            row,
          ],
        );
      },
    );
    return builder;
  }
}
