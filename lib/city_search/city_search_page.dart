import 'package:about_weather/city_search/model/city_info.dart';
import 'package:about_weather/city_search/model/place_name.dart';
import 'package:about_weather/city_search/search_item.dart';
import 'package:about_weather/dio/biz_dio/yiyuan_dio.dart';
import 'package:about_weather/main_ui/sign_banner/sign_banner.dart';
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
                _searchArea(context, "柳");
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
        itemBuilder: (context, index) {
          CityInfo info = _list[index].cityInfo;
          return InkWell(
            child: SearchItem(info: info),
            onTap: () {
              showModalBottomSheet<int>(
                context: context,
                isDismissible: true,
                builder: (BuildContext context) {
                  return _buildSign();
                },
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: 1),
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

  Widget _buildSign() {
    Widget row = Row(
      children: <Widget>[
        TextButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
          child: Text(
            "柳州 柳北",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          child: Text("确定"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    return Stack(
      children: [
        SingleChildScrollView(
          child: SignBanner(),
        ),
        row,
      ],
    );
  }
}
