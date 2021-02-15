import 'package:about_weather/main_ui/limit_banner/model/limit.dart';
import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'limit_model.g.dart';

@JsonSerializable(nullable: true)
class LimitModel {
  City city;
  List<Limit> limit;

  LimitModel({
    this.city,
    this.limit,
  });

  factory LimitModel.fromJson(Map<String, dynamic> json) =>
      _$LimitModelFromJson(json);

  Map<String, dynamic> toJson() => _$LimitModelToJson(this);
}
