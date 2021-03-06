import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  String content;
  int infoid;

  @JsonKey(name: "land_defense_id")
  String landDefenseId;

  String level;
  String name;

  @JsonKey(name: "port_defense_id")
  String portDefenseId;

  @JsonKey(name: "pub_time")
  String pubTime;

  String title;

  @JsonKey(name: "update_time")
  String updateTime;

  String type;

  Alert({
    required this.content,
    required this.infoid,
    required this.level,
    required this.name,
    required this.pubTime,
    required this.title,
    required this.type,
    required this.updateTime,
    required this.landDefenseId,
    required this.portDefenseId,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
