import 'package:json_annotation/json_annotation.dart';

part 'forecast_aqi.g.dart';

@JsonSerializable(nullable: true)
class ForecastAQI {
  String date;
  String publishTime;
  String value;

  ForecastAQI({
    this.date,
    this.publishTime,
    this.value,
  });

  factory ForecastAQI.fromJson(Map<String, dynamic> json) =>
      _$ForecastAQIFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastAQIToJson(this);
}
