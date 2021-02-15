import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable(nullable: true)
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
    this.conditionDay,
    this.conditionIdDay,
    this.conditionNight,
    this.conditionIdNight,
    this.humidity,
    this.moonphase,
    this.moonrise,
    this.moonset,
    this.pop,
    this.predictDate,
    this.qpf,
    this.sunrise,
    this.sunset,
    this.tempDay,
    this.tempNight,
    this.updatetime,
    this.uvi,
    this.windDegreesDay,
    this.windDegreesNight,
    this.windDirDay,
    this.windDirNight,
    this.windLevelDay,
    this.windLevelNight,
    this.windSpeedDay,
    this.windSpeedNight,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
