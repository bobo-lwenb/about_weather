import 'package:about_weather/city_search/model/place_name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region {
  @JsonKey(name: "ret_code")
  final int retCode;

  @JsonKey(name: "showapi_fee_code")
  final int? feeCode;

  final List<PlaceName> list;

  Region({
    required this.retCode,
    this.feeCode,
    required this.list,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
