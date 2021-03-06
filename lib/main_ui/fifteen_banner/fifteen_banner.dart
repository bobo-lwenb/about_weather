import 'package:about_weather/main_ui/fifteen_banner/model/forecast.dart';
import 'package:about_weather/main_ui/home/widgets/round_rectangle_border.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:about_weather/tool_box/format_date.dart';
import 'package:about_weather/tool_box/moji_chart.dart';
import 'package:flutter/material.dart';

class FifteenBanner extends StatefulWidget {
  final List<Forecast> list;

  FifteenBanner({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _FifteenBannerState createState() => _FifteenBannerState();
}

class _FifteenBannerState extends State<FifteenBanner> {
  @override
  Widget build(BuildContext context) {
    if (widget.list.isEmpty) return Container(height: 288);
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text("15日天气预报",
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              )),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            ListHeader(),
            Expanded(
              flex: 1,
              child: ListBody(list: widget.list),
            ),
          ],
        ),
      ],
    );
    return RRectangleBorder(child: column);
  }
}

class FifteenItem extends StatelessWidget {
  final Forecast forecast;
  final int index;

  FifteenItem({required this.forecast, required this.index});

  @override
  Widget build(BuildContext context) {
    String weekday = dayDesc(formatWeekday(forecast.predictDate), index);
    String date = formatMd(forecast.predictDate);
    String pop = forecast.pop;
    String condotionDay = forecast.conditionDay;
    String tempDay = forecast.tempDay;
    String tempNight = forecast.tempNight;
    String conditionNight = forecast.conditionNight;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("$weekday", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$date", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$pop%", style: TextStyle(color: Colors.lightBlue)),
          SizedBox(height: 8),
          Image.asset(iconPath(forecast.conditionIdDay), width: 20),
          SizedBox(height: 8),
          Text("$condotionDay", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Text("$tempDay°", style: TextStyle(color: textColor)),
          SizedBox(height: 4),
          Text("$tempNight°", style: TextStyle(color: textColor)),
          SizedBox(height: 8),
          Image.asset(iconPath(forecast.conditionIdNight), width: 20),
          SizedBox(height: 8),
          Text("$conditionNight", style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}

class ListBody extends StatefulWidget {
  final List<Forecast> list;

  ListBody({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _ListBodyState createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 243,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FifteenItem(forecast: widget.list[index], index: index);
        },
        itemCount: widget.list.length,
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Column(
        children: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              height: 48,
              child: Text("时间", style: TextStyle(color: textColor)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.white70)),
            ),
            height: 23,
            child: Text("降雨", style: TextStyle(color: Colors.lightBlue)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            height: 74,
            child: Text("日间", style: TextStyle(color: textColor)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.white70)),
            ),
            alignment: Alignment.center,
            height: 74,
            child: Text("夜间", style: TextStyle(color: textColor)),
          ),
        ],
      ),
    );
  }
}
