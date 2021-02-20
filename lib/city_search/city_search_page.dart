import 'package:about_weather/city_search/model/city_info.dart';
import 'package:about_weather/city_search/model/place_name.dart';
import 'package:about_weather/city_search/preview_city.dart';
import 'package:about_weather/city_search/search_item.dart';
import 'package:about_weather/dio/biz_dio/yiyuan_dio.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:flutter/material.dart';

class CitySearchPage extends StatefulWidget {
  @override
  _CitySearchPageState createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  List<PlaceName> _list = List.empty(growable: true);
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return TextField(
            controller: _controller,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "输入城市名搜索",
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
              },
              child: Padding(
                padding: EdgeInsets.all(16),
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
                if (value) Navigator.of(context).pop();
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
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("请输入城市名搜索")));
    } else {
      YiyuanDio.instance().areaToId(name).then((value) {
        _list = value;
        setState(() {});
      });
    }
  }
}
