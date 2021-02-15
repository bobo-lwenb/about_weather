import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:json_annotation/json_annotation.dart';

import '../city.dart';

part 'condition_model.g.dart';

@JsonSerializable(nullable: true)
class ConditionModel {
  City city;
  Condition condition;

  ConditionModel({
    this.city,
    this.condition,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
