import 'package:about_weather/city_search/model/area_to_id/city_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_name.g.dart';

@JsonSerializable(nullable: true)
class PlaceName {
  String prov;
  bool flag;
  String area;
  CityInfo cityInfo;
  String areaCode;
  String distric;
  String areaid;

  PlaceName({
    this.prov,
    this.flag,
    this.area,
    this.cityInfo,
    this.areaCode,
    this.distric,
    this.areaid,
  });

  factory PlaceName.fromJson(Map<String, dynamic> json) =>
      _$PlaceNameFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceNameToJson(this);
}
