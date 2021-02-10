import 'package:about_weather/dio/biz_dio/news_dio.dart';
import 'package:about_weather/epidemic/internal_model/china_add.dart';
import 'package:about_weather/epidemic/internal_model/china_total.dart';
import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/widgets/list_header.dart';
import 'package:about_weather/epidemic/widgets/list_internal_item.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';

class InternalTab extends StatefulWidget {
  @override
  _InternalTabState createState() => _InternalTabState();
}

class _InternalTabState extends State<InternalTab>
    with AutomaticKeepAliveClientMixin {
  String _lastUpdateTime;
  ChinaTotal _chinaTotal;
  ChinaAdd _chinaAdd;
  List<Area> _listArea;
  List<double> cellRatio = [0.2, 0.15, 0.2, 0.2, 0.15, 0.1];

  @override
  void initState() {
    super.initState();
    NewsDio.instance().getInternalData().then((total) {
      _lastUpdateTime = total.lastUpdateTime;
      _chinaTotal = total.chinaTotal;
      _chinaAdd = total.chinaAdd;
      _listArea = total.areaTree[0].children;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_chinaTotal == null || _chinaAdd == null || _listArea == null)
      return Center(child: Text("loading..."));
    Widget scrollView = CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildStaticBanner(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: 8, right: 8),
            child: _buildHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildList(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 26),
            child: Text(
              AppLocalizations.of(context).dataSource,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildMatter(),
          ),
        ),
      ],
    );
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return scrollView;
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildStaticBanner() {
    Widget banner = Table(
      border: TableBorder.symmetric(
        outside: BorderSide.none,
        inside: BorderSide(
          color: Colors.white,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      ),
      children: <TableRow>[
        TableRow(children: <Widget>[
          StatisCell(
            typeName: AppLocalizations.of(context).localExistConfirmed,
            count: _chinaTotal.localConfirm,
            changeCount: _chinaAdd.localConfirm,
            color: Colors.deepOrange,
            backgroundColor: Colors.orange[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).existConfirmed,
            count: _chinaTotal.nowConfirm,
            changeCount: _chinaAdd.nowConfirm,
            color: Colors.red,
            backgroundColor: Colors.red[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).confirmed,
            count: _chinaTotal.confirm,
            changeCount: _chinaAdd.confirm,
            color: Colors.redAccent[700],
            backgroundColor: Colors.red[100],
          ),
        ]),
        TableRow(children: <Widget>[
          StatisCell(
            typeName: AppLocalizations.of(context).symptomless,
            count: _chinaTotal.noInfect,
            changeCount: _chinaAdd.noInfect,
            color: Colors.deepPurple,
            backgroundColor: Colors.deepPurple[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).importAbroad,
            count: _chinaTotal.importedCase,
            changeCount: _chinaAdd.importedCase,
            color: Colors.blue,
            backgroundColor: Colors.blue[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).death,
            count: _chinaTotal.dead,
            changeCount: _chinaAdd.dead,
            color: Colors.black87,
            backgroundColor: Colors.black12,
          ),
        ]),
        TableRow(children: <Widget>[
          StatisCell(
            typeName: AppLocalizations.of(context).cure,
            count: _chinaTotal.heal,
            changeCount: _chinaAdd.heal,
            color: Colors.green,
            backgroundColor: Colors.green[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).existSuspect,
            count: _chinaTotal.suspect,
            changeCount: _chinaAdd.suspect,
            color: Colors.orange,
            backgroundColor: Colors.yellow[50],
          ),
          StatisCell(
            typeName: AppLocalizations.of(context).existSevere,
            count: _chinaTotal.nowSevere,
            changeCount: _chinaAdd.nowSevere,
            color: Colors.orange,
            backgroundColor: Colors.deepOrange[50],
          ),
        ]),
      ],
    );
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Text.rich(TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "${AppLocalizations.of(context).statisticsCutoff} ",
              style: TextStyle(color: Colors.grey[700]),
            ),
            TextSpan(text: "$_lastUpdateTime"),
          ],
        )),
        SizedBox(height: 18),
        Container(child: banner),
      ],
    );
    return column;
  }

  Widget _buildHeader() {
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).chinaEpidemic,
          style: TextStyle(fontSize: 26),
        ),
        SizedBox(height: 5),
        Text(
          AppLocalizations.of(context).epidemicTip,
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(height: 15),
        ListHeader(
          cellRatio: cellRatio,
          title1: AppLocalizations.of(context).area,
          title2: AppLocalizations.of(context).ec,
          title3: AppLocalizations.of(context).confirmed,
          title4: AppLocalizations.of(context).localSymptomless,
          title5: AppLocalizations.of(context).deathless,
          title6: AppLocalizations.of(context).detail,
        ),
      ],
    );
    return column;
  }

  Widget _buildList(BuildContext context) {
    Widget list = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Area area = _listArea[index];
        return InkWell(
          child: ListiternalItem(
            cellRatio: cellRatio,
            areaName: area.name,
            nowConfirm: area.total.nowConfirm,
            confirm: area.total.confirm,
            confirmAdd: area.today.confirm,
            local: area.total.wzz,
            localAdd: area.today.wzzAdd,
            dead: area.total.dead,
          ),
          onTap: () {},
        );
      },
      itemCount: _listArea.length,
    );
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: list,
      ),
    );
  }

  Widget _buildMatter() {
    Widget title = Text(
      AppLocalizations.of(context).preventionAdvice,
      style: TextStyle(fontSize: 26),
    );
    Widget matter = Column(
      children: <Widget>[
        _buildMatterTile(
          icon: Icon(Icons.info_outline_rounded, color: Colors.blue),
          text: Text(AppLocalizations.of(context).hygiene,
              style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text(AppLocalizations.of(context).hygiene1)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).hygiene2)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).hygiene3)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).hygiene4)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).hygiene5)),
        SizedBox(height: 16),
        _buildMatterTile(
          icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.red),
          text: Text(AppLocalizations.of(context).avoid,
              style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text(AppLocalizations.of(context).avoid1)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).avoid2)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).avoid3)),
        SizedBox(height: 16),
        _buildMatterTile(
          icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green),
          text: Text(AppLocalizations.of(context).sd,
              style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text(AppLocalizations.of(context).sd1)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).sd2)),
        _buildMatterTile(text: Text(AppLocalizations.of(context).sd3)),
        SizedBox(height: 16),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: matter,
        ),
      ],
    );
  }

  Widget _buildMatterTile({
    Icon icon = const Icon(Icons.circle, size: 5, color: Colors.blue),
    Widget text = const Text(""),
  }) {
    Widget row = Row(
      children: <Widget>[
        icon,
        SizedBox(width: 8),
        Expanded(child: text),
      ],
    );
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: row,
      ),
    );
  }
}
