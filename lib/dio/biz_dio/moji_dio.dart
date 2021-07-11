import 'dart:io';

import 'package:about_weather/dio/base_dio.dart';
import 'package:about_weather/main_ui/alert_banner/model/alert_model.dart';
import 'package:about_weather/main_ui/aqi_banner/model/forecast_aqi_model.dart';
import 'package:about_weather/main_ui/fifteen_banner/model/forecast_model.dart';
import 'package:about_weather/main_ui/limit_banner/model/limit_model.dart';
import 'package:about_weather/main_ui/live_index/model/live_index.dart';
import 'package:about_weather/main_ui/short_forecast/model/sfc.dart';
import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_model.dart';
import 'package:about_weather/main_ui/sign_banner/model/condition/condition_model.dart';
import 'package:about_weather/main_ui/tf_banner/model/hourly_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

const String MOJI_APPCODE = "2072f902a46c4b599699a1a557ed3257";
const String MOJI_HOST = "https://aliv8.mojicb.com";

/// 天气实况
const String CONDITION = "/whapi/json/aliweather/condition";

/// 空气质量指数
const String AQI_INDEX = "/whapi/json/aliweather/aqi";

/// 天气预报24小时
const String FORECAST_24 = "/whapi/json/aliweather/forecast24hours";

/// 天气预报15天
const String FORECAST_15 = "/whapi/json/aliweather/forecast15days";

/// AQI预报5天
const String FORECAST_AQI_5 = "/whapi/json/aliweather/aqiforecast5days";

/// 生活指数
const String LIVE_INDEX = "/whapi/json/aliweather/index";

/// 短时预报
const String SHORT_FORECAST = "/whapi/json/aliweather/shortforecast";

/// 天气预警
const String ALERT = "/whapi/json/aliweather/alert";

/// 限行数据
const String LIMIT = "/whapi/json/aliweather/limit";

class MojiDio extends BaseDio {
  static MojiDio? _instance;

  MojiDio._internal({required String baseUrl, required String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory MojiDio.instance() => _getInstance();

  static MojiDio _getInstance() {
    if (_instance == null) {
      _instance = MojiDio._internal(baseUrl: MOJI_HOST, appCode: MOJI_APPCODE);
    }
    return _instance!;
  }

  @override
  void dioSetting(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  /// 天气实况
  Future condition(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "ff826c205f8f4a59701e64e9e64e01c4",
    };
    Map<String, dynamic> result = await post(path: LIMIT, data: params);
    Map<String, dynamic> data = result["data"];
    ConditionModel model = ConditionModel.fromJson(data);
    return model.condition;
  }

  /// 空气质量指数
  Future aqiIndex(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "6e9a127c311094245fc1b2aa6d0a54fd",
    };
    Map<String, dynamic> result = await post(path: LIMIT, data: params);
    Map<String, dynamic> data = result["data"];
    AQIModel model = AQIModel.fromJson(data);
    return model.aqi;
  }

  /// 天气预报24小时
  Future forecast24(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "1b89050d9f64191d494c806f78e8ea36",
    };
    Map<String, dynamic> result = await post(path: FORECAST_24, data: params);
    Map<String, dynamic> data = result["data"];
    HourlyModel model = HourlyModel.fromJson(data);
    return model.hourly;
  }

  /// 天气预报15天
  Future forecast15(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "7538f7246218bdbf795b329ab09cc524",
    };
    Map<String, dynamic> result = await post(path: FORECAST_15, data: params);
    Map<String, dynamic> data = result["data"];
    ForecastModel model = ForecastModel.fromJson(data);
    return model.forecast;
  }

  /// AQI预报5天
  Future aqiForecast5(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "17dbf48dff33b6228f3199dce7b9a6d6",
    };
    Map<String, dynamic> result =
        await post(path: FORECAST_AQI_5, data: params);
    Map<String, dynamic> data = result["data"];
    ForecastAQIModel model = ForecastAQIModel.fromJson(data);
    return model.aqiForecast;
  }

  /// 生活指数
  Future liveIndex(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "42b0c7e2e8d00d6e80d92797fe5360fd",
    };
    Map<String, dynamic> result = await post(path: LIVE_INDEX, data: params);
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    List<dynamic> data = result["data"]["liveIndex"][formatted];
    List<LiveIndex> list = List.empty(growable: true);
    data.forEach((element) {
      LiveIndex index = LiveIndex.fromJson(element);
      list.add(index);
    });
    return list;
  }

  /// 短时预报
  Future shortForecast(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "bbc0fdc738a3877f3f72f69b1a4d30fe",
    };
    Map<String, dynamic> result =
        await post(path: SHORT_FORECAST, data: params);
    Map<String, dynamic> data = result["data"]["sfc"];
    SFC model = SFC.fromJson(data);
    return model;
  }

  /// 天气预警
  Future alert(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "d01246ac6284b5a591f875173e9e2a18",
    };
    Map<String, dynamic> result = await post(path: ALERT, data: params);
    Map<String, dynamic> data = result["data"];
    AlertModel model = AlertModel.fromJson(data);
    return model.alert;
  }

  /// 限行数据
  Future limit(String lat, String lon) async {
    Map<String, dynamic> params = {
      "lat": lat,
      "lon": lon,
      "token": "c712899b393c7b262dd7984f6eb52657",
    };
    Map<String, dynamic> result = await post(path: LIMIT, data: params);
    Map<String, dynamic> data = result["data"];
    LimitModel model = LimitModel.fromJson(data);
    return model.limit;
  }
}
