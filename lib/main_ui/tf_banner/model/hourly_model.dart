import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:about_weather/main_ui/tf_banner/model/hourly.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hourly_model.g.dart';

@JsonSerializable(nullable: true)
class HourlyModel {
  City city;
  List<Hourly> hourly;

  HourlyModel({
    this.city,
    this.hourly,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyModelToJson(this);
}
