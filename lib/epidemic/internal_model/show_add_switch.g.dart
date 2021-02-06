// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_add_switch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowAddSwitch _$ShowAddSwitchFromJson(Map<String, dynamic> json) {
  return ShowAddSwitch(
    all: json['all'] as bool,
    confirm: json['confirm'] as bool,
    suspect: json['suspect'] as bool,
    dead: json['dead'] as bool,
    heal: json['heal'] as bool,
    nowConfirm: json['nowConfirm'] as bool,
    nowSevere: json['nowSevere'] as bool,
    importedCase: json['importedCase'] as bool,
    noInfect: json['noInfect'] as bool,
    localConfirm: json['localConfirm'] as bool,
    localinfeciton: json['localinfeciton'] as bool,
  );
}

Map<String, dynamic> _$ShowAddSwitchToJson(ShowAddSwitch instance) =>
    <String, dynamic>{
      'all': instance.all,
      'confirm': instance.confirm,
      'suspect': instance.suspect,
      'dead': instance.dead,
      'heal': instance.heal,
      'nowConfirm': instance.nowConfirm,
      'nowSevere': instance.nowSevere,
      'importedCase': instance.importedCase,
      'noInfect': instance.noInfect,
      'localConfirm': instance.localConfirm,
      'localinfeciton': instance.localinfeciton,
    };
