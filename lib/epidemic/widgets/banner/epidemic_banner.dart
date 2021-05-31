import 'package:about_weather/dio/biz_dio/news_dio.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/widgets/banner/china_banner.dart';
import 'package:about_weather/epidemic/widgets/banner/local_banner.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

class EpidemicBanner extends StatefulWidget {
  final Location location;

  EpidemicBanner({Key key, this.location}) : super(key: key);

  @override
  _EpidemicBannerState createState() => _EpidemicBannerState();
}

class _EpidemicBannerState extends State<EpidemicBanner>
    with SingleTickerProviderStateMixin {
  List<String> _title = ['', ''];
  TabController _tabController;
  int _currentindex = 0;

  InternalData _model;
  Area _area;
  Locale _locale;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _title.length, vsync: this);
    NewsDio.instance().getInternalData().then((model) {
      _model = model;
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locale = Localizations.localeOf(context);
    _title = [
      "${AppLocalizations.of(context).national}",
      "-- ${AppLocalizations.of(context).epidemicData}",
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Location location = widget.location;
    if (_model != null && location != null) {
      _model.areaTree[0].children.forEach((element) {
        if (location.province.contains(element.name)) {
          _area = element;
          String provinceTitle = _locale.languageCode == "en"
              ? "${element.name} ${AppLocalizations.of(context).epidemicData}"
              : "${element.name}${AppLocalizations.of(context).epidemicData}";
          _title = [
            "${AppLocalizations.of(context).national}",
            provinceTitle,
          ];
          return;
        }
      });
    }
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTabs(_title),
        SizedBox(height: 8),
        _buildIndexedStack(_model, _area),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8.0, bottom: 8),
          child: Text(
            "${AppLocalizations.of(context).statisticsCutoff} ${_model?.lastUpdateTime}",
            style: TextStyle(color: subtextColor),
          ),
        ),
      ],
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: column,
    );
  }

  Widget _buildTabs(List<String> title) {
    Widget tabBar = TabBar(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      labelColor: Colors.deepOrangeAccent[100],
      unselectedLabelColor: Colors.grey[400],
      indicatorColor: Colors.deepOrangeAccent[100],
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: title.map((e) {
        return Tab(text: e);
      }).toList(),
      onTap: (index) {
        _currentindex = index;
        setState(() {});
      },
    );
    return tabBar;
  }

  Widget _buildIndexedStack(InternalData model, Area area) {
    Widget indexedStack = IndexedStack(
      index: _currentindex,
      children: <Widget>[
        ChinaBanner(model: model),
        LocalBanner(area: area),
      ],
    );
    return indexedStack;
  }
}
