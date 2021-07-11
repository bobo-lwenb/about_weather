import 'package:about_weather/city_search/model/city_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_name.g.dart';

@JsonSerializable()
class PlaceName {
  String prov;
  bool flag;
  String area;
  CityInfo cityInfo;
  String areaCode;
  String distric;
  String areaid;

  PlaceName({
    required this.prov,
    required this.flag,
    required this.area,
    required this.cityInfo,
    required this.areaCode,
    required this.distric,
    required this.areaid,
  });

  factory PlaceName.fromJson(Map<String, dynamic> json) =>
      _$PlaceNameFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceNameToJson(this);
}
