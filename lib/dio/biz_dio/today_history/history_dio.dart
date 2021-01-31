import 'package:about_weather/dio/base_dio.dart';
import 'package:about_weather/setting/today_history/model/today_history.dart';

const String TODAY_HISTORY_HOST = "https://jisulssdjt.market.alicloudapi.com";
const String TODAY_HISTORY_PATH = "/todayhistory/query";
const String TODAY_HISTORY_APPCODE = "2072f902a46c4b599699a1a557ed3257";

class HistoryDio extends BaseDio {
  static HistoryDio _instance;

  HistoryDio._internal({String baseUrl, String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory HistoryDio.instance() => _getInstance();

  static HistoryDio _getInstance() {
    if (_instance == null) {
      _instance = HistoryDio._internal(
          baseUrl: TODAY_HISTORY_HOST, appCode: TODAY_HISTORY_APPCODE);
    }
    return _instance;
  }

  Future getDayHistory(DateTime dateTime) async {
    Map<String, dynamic> params = {
      "day": dateTime.day,
      "month": dateTime.month
    };
    Map<String, dynamic> data =
        await get(path: TODAY_HISTORY_PATH, queryParams: params);
    return TodayHistory.fromJson(data).result;
  }
}
