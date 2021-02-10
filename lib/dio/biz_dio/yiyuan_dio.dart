import 'package:about_weather/city_search/model/region.dart';
import 'package:about_weather/dio/base_dio.dart';

const String YIYUAN_APPCODE = "2072f902a46c4b599699a1a557ed3257";
const String YIYUAN_HOST = "https://ali-weather.showapi.com";

/// 地名查询id
const String AREA_TO_ID = "/area-to-id";

class YiyuanDio extends BaseDio {
  static YiyuanDio _instance;

  YiyuanDio._internal({String baseUrl, String appCode})
      : super(baseUrl: baseUrl, appCode: appCode);

  factory YiyuanDio.instance() => _getInstance();

  static YiyuanDio _getInstance() {
    if (_instance == null) {
      _instance =
          YiyuanDio._internal(baseUrl: YIYUAN_HOST, appCode: YIYUAN_APPCODE);
    }
    return _instance;
  }

  Future areaToId(String areaName) async {
    Map<String, dynamic> params = {"area": areaName};
    Map<String, dynamic> data =
        await get(path: AREA_TO_ID, queryParams: params);
    Map<String, dynamic> regionMap = data["showapi_res_body"];
    Region region = Region.fromJson(regionMap);
    if (region.retCode == 0) {
      return region.list;
    }
  }
}
