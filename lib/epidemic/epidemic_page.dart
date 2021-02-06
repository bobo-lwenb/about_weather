import 'package:about_weather/epidemic/tabs/global_tab.dart';
import 'package:about_weather/epidemic/tabs/internal_tab.dart';
import 'package:flutter/material.dart';

class EpidemicPage extends StatefulWidget {
  @override
  _EpidemicPageState createState() => _EpidemicPageState();
}

class _EpidemicPageState extends State<EpidemicPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<String> _tabs = ['国内疫情', '海外疫情'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _buildAppBar(innerBoxIsScrolled),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            InternalTab(),
            GlobalTab(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget _buildAppBar(bool innerBoxIsScrolled) {
    Widget flexibleBanner = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "新型冠状病毒肺炎",
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      child: SliverAppBar(
        pinned: true,
        title: Text("疫情数据"),
        centerTitle: true,
        expandedHeight: 250.0,
        forceElevated: innerBoxIsScrolled,
        backgroundColor: Colors.blue,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: flexibleBanner,
        ),
        bottom: TabBar(
          tabs: _tabs.map((String name) => Tab(text: name)).toList(),
          controller: _tabController,
        ),
      ),
    );
  }
}
