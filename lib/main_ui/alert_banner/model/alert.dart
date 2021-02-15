import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable(nullable: true)
class Alert {
  String content;
  String infoid;

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
    this.content,
    this.infoid,
    this.level,
    this.name,
    this.pubTime,
    this.title,
    this.type,
    this.updateTime,
    this.landDefenseId,
    this.portDefenseId,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
