import 'package:about_weather/epidemic/internal_model/china_add.dart';
import 'package:about_weather/epidemic/internal_model/china_total.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ChinaBanner extends StatelessWidget {
  final InternalData model;

  ChinaBanner({required this.model});

  @override
  Widget build(BuildContext context) {
    ChinaTotal total = model.chinaTotal;
    ChinaAdd add = model.chinaAdd;
    Widget flex1 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.importAbroad,
            count: total.importedCase,
            changeCount: add.importedCase,
            color: Colors.yellow[900]!,
            backgroundColor: null,
          ),
        ),
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.symptomless,
            count: total.noInfect,
            changeCount: add.noInfect,
            color: Colors.deepPurple,
            backgroundColor: null,
          ),
        ),
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.cure,
            count: total.heal,
            changeCount: add.heal,
            color: Colors.green,
            backgroundColor: null,
          ),
        ),
      ],
    );
    Widget flex2 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.existConfirmed,
            count: total.nowConfirm,
            changeCount: add.nowConfirm,
            color: Colors.red,
            backgroundColor: null,
          ),
        ),
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.confirmed,
            count: total.confirm,
            changeCount: add.confirm,
            color: Colors.redAccent[700]!,
            backgroundColor: null,
          ),
        ),
        Expanded(
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.death,
            count: total.dead,
            changeCount: add.dead,
            color: Colors.black87,
            backgroundColor: null,
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
