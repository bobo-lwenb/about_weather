// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'china_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChinaTotal _$ChinaTotalFromJson(Map<String, dynamic> json) {
  return ChinaTotal(
    confirm: json['confirm'] as int,
    heal: json['heal'] as int,
    dead: json['dead'] as int,
    nowConfirm: json['nowConfirm'] as int,
    suspect: json['suspect'] as int,
    nowSevere: json['nowSevere'] as int,
    importedCase: json['importedCase'] as int,
    noInfect: json['noInfect'] as int,
    showLocalConfirm: json['showLocalConfirm'] as int,
    showlocalinfeciton: json['showlocalinfeciton'] as int,
    localConfirm: json['localConfirm'] as int,
    noInfectH5: json['noInfectH5'] as int,
    localConfirmH5: json['localConfirmH5'] as int,
  );
}

Map<String, dynamic> _$ChinaTotalToJson(ChinaTotal instance) =>
    <String, dynamic>{
      'confirm': instance.confirm,
      'heal': instance.heal,
      'dead': instance.dead,
      'nowConfirm': instance.nowConfirm,
      'suspect': instance.suspect,
      'nowSevere': instance.nowSevere,
      'importedCase': instance.importedCase,
      'noInfect': instance.noInfect,
      'showLocalConfirm': instance.showLocalConfirm,
      'showlocalinfeciton': instance.showlocalinfeciton,
      'localConfirm': instance.localConfirm,
      'noInfectH5': instance.noInfectH5,
      'localConfirmH5': instance.localConfirmH5,
    };
