import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  String conditionDay;
  String conditionIdDay;
  String conditionIdNight;
  String conditionNight;
  String humidity;
  String moonphase;
  String moonrise;
  String moonset;
  String pop;
  String predictDate;
  String qpf;
  String sunrise;
  String sunset;
  String tempDay;
  String tempNight;
  String updatetime;
  String uvi;
  String windDegreesDay;
  String windDegreesNight;
  String windDirDay;
  String windDirNight;
  String windLevelDay;
  String windLevelNight;
  String windSpeedDay;
  String windSpeedNight;

  Forecast({
    required this.conditionDay,
    required this.conditionIdDay,
    required this.conditionNight,
    required this.conditionIdNight,
    required this.humidity,
    required this.moonphase,
    required this.moonrise,
    required this.moonset,
    required this.pop,
    required this.predictDate,
    required this.qpf,
    required this.sunrise,
    required this.sunset,
    required this.tempDay,
    required this.tempNight,
    required this.updatetime,
    required this.uvi,
    required this.windDegreesDay,
    required this.windDegreesNight,
    required this.windDirDay,
    required this.windDirNight,
    required this.windLevelDay,
    required this.windLevelNight,
    required this.windSpeedDay,
    required this.windSpeedNight,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
