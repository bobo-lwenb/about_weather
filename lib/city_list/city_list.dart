import 'package:about_weather/city_list/list_item.dart';
import 'package:about_weather/city_list/model/city_model.dart';
import 'package:about_weather/city_search/city_search_page.dart';
import 'package:flutter/material.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<CityModel> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          // CityModel cityModel = _list[index];
          return InkWell(
            child: ListItem(),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
        // itemCount: _list.length,
        itemCount: 3,
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
