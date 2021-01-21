import 'package:about_weather/dio/base_dio.dart';

const String TODAY_HISTORY_HOST = "https://ali-todayhistory.showapi.com";
const String TODAY_HISTORY_PATH = "/today-of-history";
const String TODAY_HISTORY_APPCODE = "2072f902a46c4b599699a1a557ed3257";

class HistoryDio extends BaseDio {
  static HistoryDio _instance;

  HistoryDio._internal({String baseUrl, String appCode}) : super(baseUrl: baseUrl, appCode: appCode);

  factory HistoryDio.instance() => _getInstance();

  static HistoryDio _getInstance() {
    if (_instance == null) {
      _instance = HistoryDio._internal(baseUrl: TODAY_HISTORY_HOST, appCode: TODAY_HISTORY_APPCODE);
    }
    return _instance;
  }
}
