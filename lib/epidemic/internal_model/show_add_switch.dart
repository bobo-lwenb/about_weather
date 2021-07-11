import 'package:json_annotation/json_annotation.dart';

part 'show_add_switch.g.dart';

@JsonSerializable()
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
    required this.all,
    required this.confirm,
    required this.suspect,
    required this.dead,
    required this.heal,
    required this.nowConfirm,
    required this.nowSevere,
    required this.importedCase,
    required this.noInfect,
    required this.localConfirm,
    required this.localinfeciton,
  });

  factory ShowAddSwitch.fromJson(Map<String, dynamic> json) =>
      _$ShowAddSwitchFromJson(json);

  Map<String, dynamic> toJson() => _$ShowAddSwitchToJson(this);
}
