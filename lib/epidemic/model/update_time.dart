import 'package:json_annotation/json_annotation.dart';

part 'update_time.g.dart';

@JsonSerializable(nullable: true)
class UpdateTime {
  String updateTime;
  String dataSource;

  UpdateTime({this.updateTime, this.dataSource});

  factory UpdateTime.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTimeToJson(this);
}
