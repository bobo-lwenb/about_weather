import 'package:json_annotation/json_annotation.dart';

part 'percent.g.dart';

@JsonSerializable()
class Percent {
  int dbz;
  String desc;
  int icon;
  double percent;

  Percent({
    required this.dbz,
    required this.desc,
    required this.icon,
    required this.percent,
  });

  factory Percent.fromJson(Map<String, dynamic> json) =>
      _$PercentFromJson(json);

  Map<String, dynamic> toJson() => _$PercentToJson(this);
}
