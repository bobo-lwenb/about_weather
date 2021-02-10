import 'dart:convert';
import 'dart:developer';

import 'package:about_weather/city_search/model/area_to_id/city_info.dart';
import 'package:about_weather/city_search/model/area_to_id/place_name.dart';
import 'package:about_weather/city_search/search_item.dart';
import 'package:about_weather/dio/biz_dio/yiyuan_dio.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          return TextField(
            controller: _controller,
            autofocus: true,
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          CityInfo info = _list[index].cityInfo;
          return InkWell(
            child: SearchItem(info: info),
            onTap: () {},
          );
        },
        itemCount: _list.length,
      ),
    );
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
