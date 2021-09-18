import 'package:about_weather/dio/biz_dio/moji_dio.dart';
import 'package:about_weather/main_ui/short_forecast/model/sfc.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:about_weather/main_ui/tf_banner/model/hourly.dart';
import 'package:flutter/material.dart';

class PreViewModel {
  final String lat;
  final String lon;

  final ValueNotifier<PreModel> _valueNotifier = ValueNotifier(PreModel(
    condition: Condition(),
    sfc: SFC(),
    aqi: AQIIndex(),
    hourly: [],
  ));

  ValueNotifier<PreModel> get valueNotifier => _valueNotifier;

  PreViewModel({required this.lat, required this.lon});

  void initData() {
    List<Future> listFuture = [
      MojiDio.instance().condition(lat, lon),
      MojiDio.instance().shortForecast(lat, lon),
      MojiDio.instance().aqiIndex(lat, lon),
      MojiDio.instance().forecast24(lat, lon),
    ];
    Future.wait(listFuture).then((values) {
      PreModel preModel = PreModel(
        isInit: true,
        condition: values[0],
        sfc: values[1],
        aqi: values[2],
        hourly: values[3],
      );
      _valueNotifier.value = preModel;
    });
  }
}

class PreModel {
  final bool isInit;
  final Condition condition; // 天气实况
  final SFC sfc; // 短时预报
  final AQIIndex aqi; // 空气质量指数
  final List<Hourly> hourly; // 天气预报24小时

  PreModel({
    this.isInit = false,
    required this.condition,
    required this.sfc,
    required this.aqi,
    required this.hourly,
  });
}
