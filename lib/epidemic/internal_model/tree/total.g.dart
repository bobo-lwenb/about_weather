// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Total _$TotalFromJson(Map<String, dynamic> json) {
  return Total(
    nowConfirm: json['nowConfirm'] as int,
    confirm: json['confirm'] as int,
    suspect: json['suspect'] as int,
    dead: json['dead'] as int,
    deadRate: json['deadRate'] as String,
    showRate: json['showRate'] as bool,
    heal: json['heal'] as int,
    healRate: json['healRate'] as String,
    showHeal: json['showHeal'] as bool,
    wzz: json['wzz'] as int,
  );
}

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'nowConfirm': instance.nowConfirm,
      'confirm': instance.confirm,
      'suspect': instance.suspect,
      'dead': instance.dead,
      'deadRate': instance.deadRate,
      'showRate': instance.showRate,
      'heal': instance.heal,
      'healRate': instance.healRate,
      'showHeal': instance.showHeal,
      'wzz': instance.wzz,
    };
