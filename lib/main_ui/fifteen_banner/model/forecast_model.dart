import 'package:about_weather/main_ui/fifteen_banner/model/forecast.dart';
import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  City city;
  List<Forecast> forecast;

  ForecastModel({
    required this.city,
    required this.forecast,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
