import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable(nullable: true)
class Condition {
  String condition;
  String conditionId;
  String humidity;
  String icon;
  String pressure;
  String realFeel;
  String sunRise;
  String sunSet;
  String temp;
  String tips;
  String updatetime;
  String uvi;
  String vis;
  String windDegrees;
  String windDir;
  String windLevel;
  String windSpeed;

  Condition({
    this.condition,
    this.conditionId,
    this.humidity,
    this.icon,
    this.pressure,
    this.realFeel,
    this.sunRise,
    this.sunSet,
    this.temp,
    this.tips,
    this.updatetime,
    this.uvi,
    this.vis,
    this.windDegrees,
    this.windDir,
    this.windLevel,
    this.windSpeed,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
