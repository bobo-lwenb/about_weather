import 'package:json_annotation/json_annotation.dart';

part 'hourly.g.dart';

@JsonSerializable()
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
    required this.condition,
    required this.conditionId,
    required this.date,
    required this.hour,
    required this.humidity,
    required this.iconDay,
    required this.iconNight,
    required this.pop,
    required this.pressure,
    required this.qpf,
    required this.realFeel,
    required this.snow,
    required this.temp,
    required this.updatetime,
    required this.uvi,
    required this.windDegrees,
    required this.windDir,
    required this.windSpeed,
    required this.windlevel,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
