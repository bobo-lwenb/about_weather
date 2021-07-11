import 'package:json_annotation/json_annotation.dart';

part 'total.g.dart';

@JsonSerializable()
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
    required this.nowConfirm,
    required this.confirm,
    required this.suspect,
    required this.dead,
    required this.deadRate,
    required this.showRate,
    required this.heal,
    required this.healRate,
    required this.showHeal,
    required this.wzz,
  });

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}
