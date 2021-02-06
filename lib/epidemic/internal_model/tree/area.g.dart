// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
    name: json['name'] as String,
    today: json['today'] == null
        ? null
        : Today.fromJson(json['today'] as Map<String, dynamic>),
    total: json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map(
            (e) => e == null ? null : Area.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'name': instance.name,
      'today': instance.today,
      'total': instance.total,
      'children': instance.children,
    };
