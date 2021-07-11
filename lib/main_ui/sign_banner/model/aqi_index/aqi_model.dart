import 'package:about_weather/main_ui/sign_banner/model/aqi_index/aqi_index.dart';
import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aqi_model.g.dart';

@JsonSerializable()
class AQIModel {
  AQIIndex aqi;
  City city;

  AQIModel({
    required this.aqi,
    required this.city,
  });

  factory AQIModel.fromJson(Map<String, dynamic> json) =>
      _$AQIModelFromJson(json);

  Map<String, dynamic> toJson() => _$AQIModelToJson(this);
}
