import 'package:json_annotation/json_annotation.dart';

part 'china_total.g.dart';

@JsonSerializable(nullable: true)
class ChinaTotal {
  int confirm;
  int heal;
  int dead;
  int nowConfirm;
  int suspect;
  int nowSevere;
  int importedCase;
  int noInfect;
  int showLocalConfirm;
  int showlocalinfeciton;
  int localConfirm;
  int noInfectH5;
  int localConfirmH5;

  ChinaTotal({
    this.confirm,
    this.heal,
    this.dead,
    this.nowConfirm,
    this.suspect,
    this.nowSevere,
    this.importedCase,
    this.noInfect,
    this.showLocalConfirm,
    this.showlocalinfeciton,
    this.localConfirm,
    this.noInfectH5,
    this.localConfirmH5,
  });

  factory ChinaTotal.fromJson(Map<String, dynamic> json) =>
      _$ChinaTotalFromJson(json);

  Map<String, dynamic> toJson() => _$ChinaTotalToJson(this);
}
