import 'package:json_annotation/json_annotation.dart';

part 'global_statis.g.dart';

@JsonSerializable(nullable: true)
class GlobalStatis {
  int nowConfirm;
  int confirm;
  int heal;
  int dead;
  int nowConfirmAdd;
  int confirmAdd;
  int healAdd;
  int deadAdd;
  String lastUpdateTime;

  GlobalStatis({
    this.nowConfirm,
    this.confirm,
    this.heal,
    this.dead,
    this.nowConfirmAdd,
    this.confirmAdd,
    this.healAdd,
    this.deadAdd,
    this.lastUpdateTime,
  });

  factory GlobalStatis.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatisFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalStatisToJson(this);
}
