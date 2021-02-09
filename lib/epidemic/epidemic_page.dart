import 'package:about_weather/epidemic/tabs/global_tab.dart';
import 'package:about_weather/epidemic/tabs/internal_tab.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';

class EpidemicPage extends StatefulWidget {
  @override
  _EpidemicPageState createState() => _EpidemicPageState();
}

class _EpidemicPageState extends State<EpidemicPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['', ''];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabs = [
      AppLocalizations.of(context).domesticEpidemic,
      AppLocalizations.of(context).overseasEpidemic,
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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

  Widget _buildAppBar(bool innerBoxIsScrolled) {
    Widget flexibleBanner = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppLocalizations.of(context).covid_19,
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
        title: Text(AppLocalizations.of(context).epidemicData),
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
