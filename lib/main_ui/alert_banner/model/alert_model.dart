import 'package:about_weather/main_ui/sign_banner/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alert.dart';

part 'alert_model.g.dart';

@JsonSerializable()
class AlertModel {
  City? city;
  List<Alert?>? alert;

  AlertModel({
    this.city,
    this.alert,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) =>
      _$AlertModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlertModelToJson(this);
}
