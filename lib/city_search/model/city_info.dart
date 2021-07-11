import 'package:json_annotation/json_annotation.dart';

part 'city_info.g.dart';

@JsonSerializable()
class CityInfo {
  String c1;
  String c2;
  String c3;
  String c4;
  String c5;
  String c6;
  String c7;
  String c8;
  String c9;
  String c10;
  String c11;
  String c12;
  String c15;
  String c16;
  String c17;
  double longitude;
  double latitude;

  CityInfo({
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.c5,
    required this.c6,
    required this.c7,
    required this.c8,
    required this.c9,
    required this.c10,
    required this.c11,
    required this.c12,
    required this.c15,
    required this.c16,
    required this.c17,
    required this.longitude,
    required this.latitude,
  });

  factory CityInfo.fromJson(Map<String, dynamic> json) =>
      _$CityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CityInfoToJson(this);
}
