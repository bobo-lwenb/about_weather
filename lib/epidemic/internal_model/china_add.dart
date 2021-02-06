import 'package:json_annotation/json_annotation.dart';

part 'china_add.g.dart';

@JsonSerializable(nullable: true)
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
    this.confirm,
    this.heal,
    this.dead,
    this.nowConfirm,
    this.suspect,
    this.nowSevere,
    this.importedCase,
    this.noInfect,
    this.localConfirm,
    this.noInfectH5,
    this.localConfirmH5,
  });

  factory ChinaAdd.fromJson(Map<String, dynamic> json) =>
      _$ChinaAddFromJson(json);

  Map<String, dynamic> toJson() => _$ChinaAddToJson(this);
}
