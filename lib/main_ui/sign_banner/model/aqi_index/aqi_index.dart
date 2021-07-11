import 'package:json_annotation/json_annotation.dart';

part 'aqi_index.g.dart';

@JsonSerializable()
class AQIIndex {
  String? cityName;
  String? co;
  String? coC;
  String? no2;
  String? no2C;
  String? o3;
  String? o3C;
  String? pm10;
  String? pm10C;
  String? pm25;
  String? pm25C;
  String? pubtime;
  String? rank;
  String? o2;
  String? so2C;
  String? value;

  AQIIndex({
    this.cityName,
    this.co,
    this.coC,
    this.no2,
    this.no2C,
    this.o3,
    this.o3C,
    this.pm10,
    this.pm10C,
    this.pm25,
    this.pm25C,
    this.pubtime,
    this.rank,
    this.o2,
    this.so2C,
    this.value,
  });

  factory AQIIndex.fromJson(Map<String, dynamic> json) =>
      _$AQIIndexFromJson(json);

  Map<String, dynamic> toJson() => _$AQIIndexToJson(this);
}
