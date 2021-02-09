import 'package:about_weather/epidemic/internal_model/china_add.dart';
import 'package:about_weather/epidemic/internal_model/china_total.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/epidemic/widgets/statis_cell.dart';
import 'package:about_weather/intl/l10n/localizations_intl.dart';
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
            typeName: AppLocalizations.of(context).importAbroad,
            count: total?.importedCase,
            changeCount: add?.importedCase,
            color: Colors.yellow[900],
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: AppLocalizations.of(context).symptomless,
            count: total?.noInfect,
            changeCount: add?.noInfect,
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: AppLocalizations.of(context).cure,
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
            typeName: AppLocalizations.of(context).existConfirmed,
            count: total?.nowConfirm,
            changeCount: add?.nowConfirm,
            color: Colors.red,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: AppLocalizations.of(context).confirmed,
            count: total?.confirm,
            changeCount: add?.confirm,
            color: Colors.redAccent[700],
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: StatisCell(
            typeName: AppLocalizations.of(context).death,
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
