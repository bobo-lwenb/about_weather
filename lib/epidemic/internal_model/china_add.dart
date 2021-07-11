import 'package:json_annotation/json_annotation.dart';

part 'china_add.g.dart';

@JsonSerializable()
class ChinaAdd {
  int confirm;
  int heal;
  int dead;
  int nowConfirm;
  int suspect;
  int nowSevere;
  int importedCase;
  int noInfect;
  int localConfirm;
  int noInfectH5;
  int localConfirmH5;

  ChinaAdd({
    required this.confirm,
    required this.heal,
    required this.dead,
    required this.nowConfirm,
    required this.suspect,
    required this.nowSevere,
    required this.importedCase,
    required this.noInfect,
    required this.localConfirm,
    required this.noInfectH5,
    required this.localConfirmH5,
  });

  factory ChinaAdd.fromJson(Map<String, dynamic> json) =>
      _$ChinaAddFromJson(json);

  Map<String, dynamic> toJson() => _$ChinaAddToJson(this);
}
