import 'package:json_annotation/json_annotation.dart';

part 'live_index.g.dart';

@JsonSerializable()
class LiveIndex {
  int code;
  String day;
  String desc;
  String level;
  String name;
  String status;
  String updatetime;

  LiveIndex({
    required this.code,
    required this.day,
    required this.desc,
    required this.level,
    required this.name,
    required this.status,
    required this.updatetime,
  });

  factory LiveIndex.fromJson(Map<String, dynamic> json) =>
      _$LiveIndexFromJson(json);

  Map<String, dynamic> toJson() => _$LiveIndexToJson(this);
}
