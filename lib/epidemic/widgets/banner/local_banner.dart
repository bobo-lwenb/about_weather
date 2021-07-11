import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/internal_model/tree/today.dart';
import 'package:about_weather/epidemic/internal_model/tree/total.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocalBanner extends StatelessWidget {
  final Area area;

  LocalBanner({
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    Total total = area.total!;
    Today today = area.today!;
    Widget flex1 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.existConfirmed,
            count: total.nowConfirm,
            isShowChange: false,
            color: Colors.red,
            backgroundColor: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.confirmed,
            count: total.confirm,
            changeCount: today.confirm,
            color: Colors.redAccent[700]!,
            backgroundColor: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
              topColor: textColor,
              subColor: subtextColor,
              typeName: AppLocalizations.of(context)!.existSuspect,
              count: total.suspect,
              isShowChange: false,
              color: Colors.orange,
              backgroundColor: null),
        ),
      ],
    );
    Widget flex2 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.symptomless,
            count: total.wzz,
            changeCount: today.wzzAdd,
            color: Colors.deepPurple,
            backgroundColor: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.cure,
            count: total.heal,
            isShowChange: false,
            color: Colors.green,
            backgroundColor: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            topColor: textColor,
            subColor: subtextColor,
            typeName: AppLocalizations.of(context)!.death,
            count: total.dead,
            isShowChange: false,
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
