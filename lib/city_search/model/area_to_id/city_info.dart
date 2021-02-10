import 'package:json_annotation/json_annotation.dart';

part 'city_info.g.dart';

@JsonSerializable(nullable: true)
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
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.c5,
    this.c6,
    this.c7,
    this.c8,
    this.c9,
    this.c10,
    this.c11,
    this.c12,
    this.c15,
    this.c16,
    this.c17,
    this.longitude,
    this.latitude,
  });

  factory CityInfo.fromJson(Map<String, dynamic> json) =>
      _$CityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CityInfoToJson(this);
}
