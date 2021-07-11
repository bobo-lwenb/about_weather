import 'package:json_annotation/json_annotation.dart';

part 'global_statis.g.dart';

@JsonSerializable()
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
    required this.nowConfirm,
    required this.confirm,
    required this.heal,
    required this.dead,
    required this.nowConfirmAdd,
    required this.confirmAdd,
    required this.healAdd,
    required this.deadAdd,
    required this.lastUpdateTime,
  });

  factory GlobalStatis.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatisFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalStatisToJson(this);
}
