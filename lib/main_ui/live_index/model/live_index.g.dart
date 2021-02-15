// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveIndex _$LiveIndexFromJson(Map<String, dynamic> json) {
  return LiveIndex(
    code: json['code'] as int,
    day: json['day'] as String,
    desc: json['desc'] as String,
    level: json['level'] as String,
    name: json['name'] as String,
    status: json['status'] as String,
    updatetime: json['updatetime'] as String,
  );
}

Map<String, dynamic> _$LiveIndexToJson(LiveIndex instance) => <String, dynamic>{
      'code': instance.code,
      'day': instance.day,
      'desc': instance.desc,
      'level': instance.level,
      'name': instance.name,
      'status': instance.status,
      'updatetime': instance.updatetime,
    };
