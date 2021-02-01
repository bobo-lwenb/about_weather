import 'package:about_weather/dio/base_dio.dart';
import 'package:about_weather/epidemic/model/epidemic.dart';

const String EPIDEMIC_HOST = "https://ncovdata.market.alicloudapi.com";
const String EPIDEMIC_PATH = "/ncov/cityDiseaseInfoWithTrend";
const String EPIDEMIC_APPCODE = "2072f902a46c4b599699a1a557ed3257";

class EpidemicDio extends BaseDio {
  static EpidemicDio _instance;

  EpidemicDio._internal({String baseUrl, String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory EpidemicDio.instance() => _getInstance();

  static EpidemicDio _getInstance() {
    if (_instance == null) {
      _instance = EpidemicDio._internal(
          baseUrl: EPIDEMIC_HOST, appCode: EPIDEMIC_APPCODE);
    }
    return _instance;
  }

  Future getEpidemicData() async {
    Map<String, dynamic> data = await get(path: EPIDEMIC_PATH);
    return Epidemic.fromJson(data);
  }
}
