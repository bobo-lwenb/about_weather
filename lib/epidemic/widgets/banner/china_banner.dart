import 'package:about_weather/epidemic/internal_model/china_add.dart';
import 'package:about_weather/epidemic/internal_model/china_total.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:flutter/material.dart';

class ChinaBanner extends StatelessWidget {
  final InternalData model;

  ChinaBanner({this.model});

  @override
  Widget build(BuildContext context) {
    ChinaTotal total = model?.chinaTotal;
    ChinaAdd add = model?.chinaAdd;
    Widget flex1 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: StatisCell(
            typeName: "境外输入",
            count: total?.importedCase,
            changeCount: add?.importedCase,
            color: Colors.yellow[900],
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: "无症状感染者",
            count: total?.noInfect,
            changeCount: add?.noInfect,
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: "累计治愈",
            count: total?.heal,
            changeCount: add?.heal,
            color: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
    Widget flex2 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: StatisCell(
            typeName: "现有确诊",
            count: total?.nowConfirm,
            changeCount: add?.nowConfirm,
            color: Colors.red,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: "累计确诊",
            count: total?.confirm,
            changeCount: add?.confirm,
            color: Colors.redAccent[700],
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: "累计死亡",
            count: total?.dead,
            changeCount: add?.dead,
            color: Colors.black87,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
    return Column(
      children: <Widget>[
        flex1,
        flex2,
      ],
    );
  }
}
