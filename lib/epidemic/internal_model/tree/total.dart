import 'package:json_annotation/json_annotation.dart';

part 'total.g.dart';

@JsonSerializable(nullable: true)
class Total {
  int nowConfirm;
  int confirm;
  int suspect;
  int dead;
  String deadRate;
  bool showRate;
  int heal;
  String healRate;
  bool showHeal;
  int wzz;

  Total({
    this.nowConfirm,
    this.confirm,
    this.suspect,
    this.dead,
    this.deadRate,
    this.showRate,
    this.heal,
    this.healRate,
    this.showHeal,
    this.wzz,
  });

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}
