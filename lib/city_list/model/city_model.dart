import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  String top;
  String name;
  String temperature;
  String icon;

  CityModel({
    required this.top,
    required this.name,
    required this.temperature,
    required this.icon,
  });

  CityModel.empty()
      : top = '',
        name = '',
        temperature = '',
        icon = '';

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
