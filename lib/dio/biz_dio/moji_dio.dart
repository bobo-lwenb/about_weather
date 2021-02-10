import 'package:about_weather/dio/base_dio.dart';

const String MOJI_APPCODE = "2072f902a46c4b599699a1a557ed3257";
const String MOJI_HOST = "https://aliv8.data.moji.com";

class MojiDio extends BaseDio {
  static MojiDio _instance;

  MojiDio._internal({String baseUrl, String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory MojiDio.instance() => _getInstance();

  static MojiDio _getInstance() {
    if (_instance == null) {
      _instance = MojiDio._internal(baseUrl: MOJI_HOST, appCode: MOJI_APPCODE);
    }
    return _instance;
  }
}
