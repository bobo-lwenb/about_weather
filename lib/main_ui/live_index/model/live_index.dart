import 'package:json_annotation/json_annotation.dart';

part 'live_index.g.dart';

@JsonSerializable(nullable: true)
class LiveIndex {
  int code;
  String day;
  String desc;
  String level;
  String name;
  String status;
  String updatetime;

  LiveIndex({
    this.code,
    this.day,
    this.desc,
    this.level,
    this.name,
    this.status,
    this.updatetime,
  });

  factory LiveIndex.fromJson(Map<String, dynamic> json) =>
      _$LiveIndexFromJson(json);

  Map<String, dynamic> toJson() => _$LiveIndexToJson(this);
}
