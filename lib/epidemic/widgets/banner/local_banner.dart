import 'package:about_weather/epidemic/internal_model/tree/area.dart';
import 'package:about_weather/epidemic/internal_model/tree/today.dart';
import 'package:about_weather/epidemic/internal_model/tree/total.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
import 'package:flutter/material.dart';

class LocalBanner extends StatelessWidget {
  final Area area;

  LocalBanner({
    this.area,
  });

  @override
  Widget build(BuildContext context) {
    Total total = area?.total;
    Today today = area?.today;
    Widget flex1 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).existConfirmed,
            count: total?.nowConfirm,
            isShowChange: false,
            color: Colors.red,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).confirmed,
            count: total?.confirm,
            changeCount: today?.confirm,
            color: Colors.redAccent[700],
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).existSuspect,
            count: total?.suspect,
            isShowChange: false,
            color: Colors.orange,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
    Widget flex2 = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).symptomless,
            count: total?.wzz,
            changeCount: today?.wzzAdd,
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).cure,
            count: total?.heal,
            isShowChange: false,
            color: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: StatisCell(
            typeName: AppLocalizations.of(context).death,
            count: total?.dead,
            isShowChange: false,
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
