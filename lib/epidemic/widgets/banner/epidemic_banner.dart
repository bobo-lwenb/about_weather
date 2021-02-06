import 'package:about_weather/dio/biz_dio/news_epidemic/news_dio.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/widgets/banner/china_banner.dart';
import 'package:about_weather/epidemic/widgets/banner/local_banner.dart';
import 'package:flutter/material.dart';

class EpidemicBanner extends StatefulWidget {
  final String province;

  EpidemicBanner({this.province});

  @override
  _EpidemicBannerState createState() => _EpidemicBannerState();
}

class _EpidemicBannerState extends State<EpidemicBanner>
    with SingleTickerProviderStateMixin {
  List<String> _title;
  TabController _tabController;
  int _currentindex = 0;

  String _lastUpdateTime;
  InternalData _model;
  Area _area;

  @override
  void initState() {
    super.initState();
    _title = ["全国疫情数据", "${widget.province}疫情数据"];
    _tabController = TabController(length: _title.length, vsync: this);
    NewsDio.instance().getInternalData().then((model) {
      _lastUpdateTime = model.lastUpdateTime;
      _model = model;
      _model.areaTree[0].children.forEach((element) {
        if (widget.province.contains(element.name)) _area = element;
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_model == null) return Center(child: Text("loading..."));
    Widget tabBar = TabBar(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      labelColor: Colors.deepOrangeAccent[400],
      unselectedLabelColor: Colors.grey[400],
      indicatorColor: Colors.deepOrangeAccent[400],
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _title.map((e) {
        return Tab(text: e);
      }).toList(),
      onTap: (index) {
        _currentindex = index;
        setState(() {});
      },
    );
    Widget indexedStack = IndexedStack(
      index: _currentindex,
      children: <Widget>[
        ChinaBanner(model: _model),
        LocalBanner(
          area: _area,
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tabBar,
        SizedBox(height: 8),
        indexedStack,
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8.0, bottom: 8),
          child: Text("数据统计截止 $_lastUpdateTime"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
