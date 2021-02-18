import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forecast_aqi.dart';

part 'forecast_aqi_model.g.dart';

@JsonSerializable(nullable: true)
class ForecastAQIModel {
  City city;
  List<ForecastAQI> aqiForecast;

  ForecastAQIModel({
    this.city,
    this.aqiForecast,
  });

  factory ForecastAQIModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastAQIModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastAQIModelToJson(this);
}
