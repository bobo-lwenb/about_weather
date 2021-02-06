// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_statis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalStatis _$GlobalStatisFromJson(Map<String, dynamic> json) {
  return GlobalStatis(
    nowConfirm: json['nowConfirm'] as int,
    confirm: json['confirm'] as int,
    heal: json['heal'] as int,
    dead: json['dead'] as int,
    nowConfirmAdd: json['nowConfirmAdd'] as int,
    confirmAdd: json['confirmAdd'] as int,
    healAdd: json['healAdd'] as int,
    deadAdd: json['deadAdd'] as int,
    lastUpdateTime: json['lastUpdateTime'] as String,
  );
}

Map<String, dynamic> _$GlobalStatisToJson(GlobalStatis instance) =>
    <String, dynamic>{
      'nowConfirm': instance.nowConfirm,
      'confirm': instance.confirm,
      'heal': instance.heal,
      'dead': instance.dead,
      'nowConfirmAdd': instance.nowConfirmAdd,
      'confirmAdd': instance.confirmAdd,
      'healAdd': instance.healAdd,
      'deadAdd': instance.deadAdd,
      'lastUpdateTime': instance.lastUpdateTime,
    };
