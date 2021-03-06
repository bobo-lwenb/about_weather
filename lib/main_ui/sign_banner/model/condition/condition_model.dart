import 'package:about_weather/main_ui/sign_banner/model/condition/condition.dart';
import 'package:json_annotation/json_annotation.dart';

import '../city.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel {
  City city;
  Condition condition;

  ConditionModel({
    required this.city,
    required this.condition,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
