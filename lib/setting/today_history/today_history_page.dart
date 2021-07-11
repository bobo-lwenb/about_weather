import 'package:about_weather/dio/biz_dio/history_dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'model/result.dart';

class TodayHistoryPage extends StatefulWidget {
  @override
  _TodayHistoryPageState createState() => _TodayHistoryPageState();
}

class _TodayHistoryPageState extends State<TodayHistoryPage> {
  List<Result> _list = List.empty(growable: true);
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    HistoryDio.instance().getDayHistory(_dateTime).then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            Text(AppLocalizations.of(context)!.todayInHistory),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text("${_dateTime.month}-${_dateTime.day}",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Result result = _list[index];
            return Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(result.title!, style: TextStyle(fontSize: 22)),
                  ),
                  Text("${result.year}-${result.month}-${result.day}"),
                  Divider(),
                  Html(data: result.content, shrinkWrap: true),
                ],
              ),
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
