import 'package:json_annotation/json_annotation.dart';

part 'forecast_aqi.g.dart';

@JsonSerializable()
class ForecastAQI {
  String date;
  String publishTime;
  int value;

  ForecastAQI({
    required this.date,
    required this.publishTime,
    required this.value,
  });

  factory ForecastAQI.fromJson(Map<String, dynamic> json) =>
      _$ForecastAQIFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastAQIToJson(this);
}
