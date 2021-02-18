// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Percent _$PercentFromJson(Map<String, dynamic> json) {
  return Percent(
    dbz: json['dbz'] as int,
    desc: json['desc'] as String,
    icon: json['icon'] as int,
    percent: (json['percent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PercentToJson(Percent instance) => <String, dynamic>{
      'dbz': instance.dbz,
      'desc': instance.desc,
      'icon': instance.icon,
      'percent': instance.percent,
    };
