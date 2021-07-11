import 'package:json_annotation/json_annotation.dart';

part 'china_total.g.dart';

@JsonSerializable()
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
    required this.confirm,
    required this.heal,
    required this.dead,
    required this.nowConfirm,
    required this.suspect,
    required this.nowSevere,
    required this.importedCase,
    required this.noInfect,
    required this.showLocalConfirm,
    required this.showlocalinfeciton,
    required this.localConfirm,
    required this.noInfectH5,
    required this.localConfirmH5,
  });

  factory ChinaTotal.fromJson(Map<String, dynamic> json) =>
      _$ChinaTotalFromJson(json);

  Map<String, dynamic> toJson() => _$ChinaTotalToJson(this);
}
