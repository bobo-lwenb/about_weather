import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  bool showTop;
  String name;
  String temperature;
  String icon;

  CityModel({
    required this.showTop,
    required this.name,
    required this.temperature,
    required this.icon,
  });

  CityModel.empty()
      : showTop = false,
        name = '',
        temperature = '',
        icon = '';

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
