import 'package:about_weather/dio/biz_dio/news_dio.dart';
import 'package:about_weather/epidemic/global_model/foreign_model.dart';
import 'package:about_weather/epidemic/global_model/global_statis.dart';
import 'package:about_weather/epidemic/widgets/list_global_item.dart';
import 'package:about_weather/epidemic/widgets/list_header.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class GlobalTab extends StatefulWidget {
  @override
  _GlobalTabState createState() => _GlobalTabState();
}

class _GlobalTabState extends State<GlobalTab>
    with AutomaticKeepAliveClientMixin {
  List<double> cellRatio = [0.15, 0.2, 0.2, 0.2, 0.15, 0.1];
  GlobalStatis? _globalStatis;
  List<ForeignModel>? _foreignList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      NewsDio.instance().getGlobalData().then((sources) {
        _globalStatis = sources.globalStatis;
        _foreignList = sources.foreignList;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_globalStatis == null || _foreignList == null)
      return Center(child: Text("loading..."));
    Widget scrollView = CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: _buildBanner(),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildHeader(),
        ),
        SliverToBoxAdapter(
          child: _buildList(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 26),
            child: Text(
              AppLocalizations.of(context)!.source,
              style: TextStyle(color: Colors.grey[500]),
            ),
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

  Widget _buildBanner() {
    Widget banner = Table(
      border: TableBorder.symmetric(
        outside: BorderSide.none,
        inside: BorderSide(
          color: isDark(context) ? Colors.grey[850]! : Colors.white,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      ),
      children: <TableRow>[
        TableRow(children: <Widget>[
          StatisCell(
            topColor: Colors.grey[850],
            typeName: AppLocalizations.of(context)!.confirmed,
            count: _globalStatis!.confirm,
            changeCount: _globalStatis!.confirmAdd,
            color: Colors.redAccent[700]!,
            backgroundColor: Colors.red[100]!,
          ),
          StatisCell(
            topColor: Colors.grey[850],
            typeName: AppLocalizations.of(context)!.existConfirmed,
            count: _globalStatis!.nowConfirm,
            changeCount: _globalStatis!.nowConfirmAdd,
            color: Colors.red,
            backgroundColor: Colors.red[50]!,
          ),
        ]),
        TableRow(children: <Widget>[
          StatisCell(
            topColor: Colors.grey[850],
            typeName: AppLocalizations.of(context)!.cure,
            count: _globalStatis!.heal,
            changeCount: _globalStatis!.healAdd,
            color: Colors.green,
            backgroundColor: Colors.green[50]!,
          ),
          StatisCell(
            topColor: Colors.grey[850],
            typeName: AppLocalizations.of(context)!.death,
            count: _globalStatis!.dead,
            changeCount: _globalStatis!.deadAdd,
            color: Colors.black87,
            backgroundColor: Colors.grey[200]!,
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
                text: "${AppLocalizations.of(context)!.statisticsCutoff} "),
            TextSpan(text: "${_globalStatis!.lastUpdateTime}"),
          ],
        )),
        SizedBox(height: 18),
        banner,
      ],
    );
    return column;
  }

  Widget _buildHeader() {
    Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.overseasEpidemic,
          style: TextStyle(fontSize: 26),
        ),
        SizedBox(height: 8),
        ListHeader(
          cellRatio: cellRatio,
          title1: AppLocalizations.of(context)!.area,
          title2: AppLocalizations.of(context)!.nowCases,
          title3: AppLocalizations.of(context)!.confirmed,
          title4: AppLocalizations.of(context)!.cure,
          title5: AppLocalizations.of(context)!.deathless,
          title6: AppLocalizations.of(context)!.detail,
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: column,
    );
  }

  Widget _buildList(BuildContext context) {
    Widget list = ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        ForeignModel model = _foreignList![index];
        return InkWell(
          child: ListGlobalItem(
            cellRatio: cellRatio,
            value0: model.name!,
            value1: "${model.nowConfirm}",
            value2: "${model.confirm}",
            value3: "${model.heal}",
            value4: "${model.dead}",
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: 100,
                      child: Center(
                          child: Text(
                              AppLocalizations.of(context)!.detailsExpect)),
                    ),
                  );
                });
          },
        );
      },
      separatorBuilder: (context, index) => Divider(height: 1),
      itemCount: _foreignList!.length,
    );
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: list,
      ),
    );
  }
}
