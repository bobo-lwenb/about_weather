import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(nullable: true)
class CityModel {
  String top;
  String name;
  String temperature;
  String icon;

  CityModel({
    this.top,
    this.name,
    this.temperature,
    this.icon,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
