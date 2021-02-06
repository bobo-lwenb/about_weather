// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Today _$TodayFromJson(Map<String, dynamic> json) {
  return Today(
    confirm: json['confirm'] as int,
    confirmCuts: json['confirmCuts'] as int,
    isUpdated: json['isUpdated'] as bool,
    tip: json['tip'] as String,
    wzzAdd: json['wzz_add'] as int,
  );
}

Map<String, dynamic> _$TodayToJson(Today instance) => <String, dynamic>{
      'confirm': instance.confirm,
      'confirmCuts': instance.confirmCuts,
      'isUpdated': instance.isUpdated,
      'tip': instance.tip,
      'wzz_add': instance.wzzAdd,
    };
