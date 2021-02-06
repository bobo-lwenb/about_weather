import 'package:about_weather/dio/biz_dio/news_epidemic/news_dio.dart';
import 'package:about_weather/epidemic/internal_model/china_add.dart';
import 'package:about_weather/epidemic/internal_model/china_total.dart';
import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/widgets/list_header.dart';
import 'package:about_weather/epidemic/widgets/list_internal_item.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
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
              "数据来源：各地卫健委公开数据",
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
            typeName: "本土现有确诊",
            count: _chinaTotal.localConfirm,
            changeCount: _chinaAdd.localConfirm,
            color: Colors.deepOrange,
            backgroundColor: Colors.orange[50],
          ),
          StatisCell(
            typeName: "现有确诊",
            count: _chinaTotal.nowConfirm,
            changeCount: _chinaAdd.nowConfirm,
            color: Colors.red,
            backgroundColor: Colors.red[50],
          ),
          StatisCell(
            typeName: "累计确诊",
            count: _chinaTotal.confirm,
            changeCount: _chinaAdd.confirm,
            color: Colors.redAccent[700],
            backgroundColor: Colors.red[100],
          ),
        ]),
        TableRow(children: <Widget>[
          StatisCell(
            typeName: "无症状感染者",
            count: _chinaTotal.noInfect,
            changeCount: _chinaAdd.noInfect,
            color: Colors.deepPurple,
            backgroundColor: Colors.deepPurple[50],
          ),
          StatisCell(
            typeName: "境外输入",
            count: _chinaTotal.importedCase,
            changeCount: _chinaAdd.importedCase,
            color: Colors.blue,
            backgroundColor: Colors.blue[50],
          ),
          StatisCell(
            typeName: "累计死亡",
            count: _chinaTotal.dead,
            changeCount: _chinaAdd.dead,
            color: Colors.black87,
            backgroundColor: Colors.black12,
          ),
        ]),
        TableRow(children: <Widget>[
          StatisCell(
            typeName: "累计治愈",
            count: _chinaTotal.heal,
            changeCount: _chinaAdd.heal,
            color: Colors.green,
            backgroundColor: Colors.green[50],
          ),
          StatisCell(
            typeName: "现有疑似",
            count: _chinaTotal.suspect,
            changeCount: _chinaAdd.suspect,
            color: Colors.orange,
            backgroundColor: Colors.yellow[50],
          ),
          StatisCell(
            typeName: "现有重症",
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
              text: "数据统计截止 ",
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
          "中国疫情（包括港澳台）",
          style: TextStyle(fontSize: 26),
        ),
        SizedBox(height: 5),
        Text(
          "7:00-10:00为更新高峰，数据如有滞后请谅解。",
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(height: 15),
        ListHeader(
          cellRatio: cellRatio,
          title1: "地区",
          title2: "现有\n确诊",
          title3: "累计确诊",
          title4: "本土现有\n无症状",
          title5: "死亡",
          title6: "详情",
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
      "新冠肺炎预防建议",
      style: TextStyle(fontSize: 26),
    );
    Widget matter = Column(
      children: <Widget>[
        _buildMatterTile(
          icon: Icon(Icons.info_outline_rounded, color: Colors.blue),
          text: Text("个人卫生", style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text("勤洗手，要用洗手液和清水清洗税收，搓手洗至少20秒，洗手后及时擦干。")),
        _buildMatterTile(text: Text("保持双手清洁，特别是在触摸眼、口、鼻或耳之前。")),
        _buildMatterTile(
            text: Text("打喷嚏或咳嗽时应用纸巾捂住口鼻，然后把纸巾弃置有盖的垃圾桶内，最后马上清洗双手。")),
        _buildMatterTile(text: Text("保持室内空气流通。")),
        _buildMatterTile(text: Text("从外带回家中的物品如果可以，尽量用酒精消毒。")),
        SizedBox(height: 16),
        _buildMatterTile(
          icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.red),
          text: Text("尽量避免", style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text("避免前往人流密集的场所，如不可避免，请戴好外科口罩。")),
        _buildMatterTile(text: Text("注意食品安全安全和卫生，避免进食或饮用生或未熟透的动物食品，包括肉蛋奶。")),
        _buildMatterTile(text: Text("避免长时间佩戴同一只口罩，条件允许适时更换口罩。")),
        SizedBox(height: 16),
        _buildMatterTile(
          icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green),
          text: Text("尽快就诊", style: TextStyle(fontSize: 22)),
        ),
        _buildMatterTile(text: Text("如有身体不适，特别是发烧咳嗽，佩戴好口罩并及时就诊。")),
        _buildMatterTile(text: Text("就诊时请保持好社交距离。")),
        _buildMatterTile(text: Text("就诊完返回家中时，及时洗手。")),
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
