import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/dio/biz_dio/news_dio.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';
import 'package:about_weather/main_ui/alert_banner/model/alert.dart';
import 'package:about_weather/main_ui/aqi_banner/model/forecast_aqi.dart';
import 'package:about_weather/main_ui/fifteen_banner/model/forecast.dart';
import 'package:about_weather/main_ui/limit_banner/model/limit.dart';
import 'package:about_weather/main_ui/live_index/model/live_index.dart';
import 'package:about_weather/main_ui/short_forecast/model/sfc.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/main_ui/tf_banner/model/hourly.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  final String lat;
  final String lon;

  final ValueNotifier<HomeModel> _valueNotifier = ValueNotifier(HomeModel(
    condition: Condition(),
    sfc: SFC(),
    aqi: AQIIndex(),
    hourly: [],
    forecast: [],
    aqiForecast: [],
    liveList: [],
    alert: [],
    limit: [],
    internalData: InternalData(),
  ));

  ValueNotifier<HomeModel> get valueNotifier => _valueNotifier;

  HomeViewModel({required this.lat, required this.lon});

  void initData() {
    List<Future> listFuture = [
      MojiDio.instance().condition(lat, lon),
      MojiDio.instance().shortForecast(lat, lon),
      MojiDio.instance().aqiIndex(lat, lon),
      MojiDio.instance().forecast24(lat, lon),
      MojiDio.instance().forecast15(lat, lon),
      MojiDio.instance().aqiForecast5(lat, lon),
      MojiDio.instance().liveIndex(lat, lon),
      MojiDio.instance().alert(lat, lon),
      MojiDio.instance().limit(lat, lon),
      NewsDio.instance().getInternalData(),
    ];
    Future.wait(listFuture).then((values) {
      HomeModel homeModel = HomeModel(
        isInit: true,
        condition: values[0],
        sfc: values[1],
        aqi: values[2],
        hourly: values[3],
        forecast: values[4],
        aqiForecast: values[5],
        liveList: values[6],
        alert: values[7],
        limit: values[8],
        internalData: values[9],
      );
      _valueNotifier.value = homeModel;
    });
  }
}

class HomeModel {
  final bool isInit;
  final Condition condition; // ????????????
  final SFC sfc; // ????????????
  final AQIIndex aqi; // ??????????????????
  final List<Hourly> hourly; // ????????????24??????
  final List<Forecast> forecast; // ????????????15???
  final List<ForecastAQI> aqiForecast; // AQI??????5???
  final List<LiveIndex> liveList; // ????????????
  final List<Alert?>? alert; // ????????????
  final List<Limit?>? limit; // ????????????
  final InternalData internalData; // ????????????

  HomeModel({
    this.isInit = false,
    required this.condition,
    required this.sfc,
    required this.aqi,
    required this.hourly,
    required this.forecast,
    required this.aqiForecast,
    required this.liveList,
    required this.alert,
    required this.limit,
    required this.internalData,
  });
}
