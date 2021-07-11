import 'dart:convert';

import 'package:about_weather/dio/base_dio.dart';
import 'package:about_weather/epidemic/global_model/global_sources.dart';
import 'package:about_weather/epidemic/internal_model/internal_data.dart';

const String NEWS_HOST = "https://view.inews.qq.com";
const String INTERNAL_PATH = "/g2/getOnsInfo?name=disease_h5";
const String GLOBAL_PATH = "/g2/getOnsInfo?name=disease_foreign";

class NewsDio extends BaseDio {
  static NewsDio? _instance;

  NewsDio._internal({required String baseUrl, required String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory NewsDio.instance() => _getInstance();

  static NewsDio _getInstance() {
    if (_instance == null) {
      _instance = NewsDio._internal(baseUrl: NEWS_HOST, appCode: '');
    }
    return _instance!;
  }

  Future<InternalData> getInternalData() async {
    Map<String, dynamic> data = await get(path: INTERNAL_PATH);
    String result = data["data"];
    return InternalData.fromJson(json.decode(result));
  }

  Future<GlobalSources> getGlobalData() async {
    Map<String, dynamic> data = await get(path: GLOBAL_PATH);
    String result = data["data"];
    return GlobalSources.fromJson(json.decode(result));
  }
}
