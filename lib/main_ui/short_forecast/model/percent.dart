import 'package:json_annotation/json_annotation.dart';

part 'percent.g.dart';

@JsonSerializable(nullable: true)
class Percent {
  int dbz;
  String desc;
  int icon;
  int percent;

  Percent({
    this.dbz,
    this.desc,
    this.icon,
    this.percent,
  });

  factory Percent.fromJson(Map<String, dynamic> json) =>
      _$PercentFromJson(json);

  Map<String, dynamic> toJson() => _$PercentToJson(this);
}
