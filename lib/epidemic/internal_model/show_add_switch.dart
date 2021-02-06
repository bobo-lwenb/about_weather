import 'package:json_annotation/json_annotation.dart';

part 'show_add_switch.g.dart';

@JsonSerializable(nullable: true)
class ShowAddSwitch {
  bool all;
  bool confirm;
  bool suspect;
  bool dead;
  bool heal;
  bool nowConfirm;
  bool nowSevere;
  bool importedCase;
  bool noInfect;
  bool localConfirm;
  bool localinfeciton;

  ShowAddSwitch({
    this.all,
    this.confirm,
    this.suspect,
    this.dead,
    this.heal,
    this.nowConfirm,
    this.nowSevere,
    this.importedCase,
    this.noInfect,
    this.localConfirm,
    this.localinfeciton,
  });

  factory ShowAddSwitch.fromJson(Map<String, dynamic> json) =>
      _$ShowAddSwitchFromJson(json);

  Map<String, dynamic> toJson() => _$ShowAddSwitchToJson(this);
}
