import 'package:json_annotation/json_annotation.dart';

part 'hourly.g.dart';

@JsonSerializable(nullable: true)
class Hourly {
  String condition;
  String conditionId;
  String date;
  String hour;
  String humidity;
  String iconDay;
  String iconNight;
  String pop;
  String pressure;
  String qpf;
  String realFeel;
  String snow;
  String temp;
  String updatetime;
  String uvi;
  String windDegrees;
  String windDir;
  String windSpeed;
  String windlevel;

  Hourly({
    this.condition,
    this.conditionId,
    this.date,
    this.hour,
    this.humidity,
    this.iconDay,
    this.iconNight,
    this.pop,
    this.pressure,
    this.qpf,
    this.realFeel,
    this.snow,
    this.temp,
    this.updatetime,
    this.uvi,
    this.windDegrees,
    this.windDir,
    this.windSpeed,
    this.windlevel,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
