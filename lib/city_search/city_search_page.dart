import 'package:about_weather/city_search/model/city_info.dart';
import 'package:about_weather/city_search/model/place_name.dart';
import 'package:about_weather/city_search/preview_city.dart';
import 'package:about_weather/city_search/search_item.dart';
import 'package:about_weather/dio/biz_dio/yiyuan_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CitySearchPage extends StatefulWidget {
  @override
  _CitySearchPageState createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  List<PlaceName> _list = List.empty(growable: true);
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return TextField(
            focusNode: _focusNode,
            controller: _controller,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.citySearch,
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onSubmitted: (text) {
              _searchArea(context, text);
            },
          );
        }),
        actions: [
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                String text = _controller.text;
                _searchArea(context, text);
                _focusNode.unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(Icons.search_rounded),
              ),
            );
          }),
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          CityInfo info = _list[index].cityInfo;
          Location location = _cityinfo2Location(info);
          return InkWell(
            child: SearchItem(info: info),
            onTap: () {
              showModalBottomSheet<bool>(
                context: context,
                isDismissible: true,
                builder: (BuildContext context) {
                  return PreviewCity(location: location);
                },
              ).then((value) {
                if (value!) Navigator.of(context).pop();
              });
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: 1),
        itemCount: _list.length,
      ),
    );
  }

  Location _cityinfo2Location(CityInfo info) {
    Location location = Location();
    location.latitude = info.latitude;
    location.longitude = info.longitude;
    location.province = info.c7;
    location.city = info.c5;
    location.district = info.c3;
    return location;
  }

  void _searchArea(BuildContext context, String name) {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.citySearch)));
    } else {
      YiyuanDio.instance().areaToId(name).then((list) {
        if (list == null || (list as List).isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppLocalizations.of(context)!.cityNoMatch)));
        }
        _list = list;
        setState(() {});
      });
    }
  }
}
