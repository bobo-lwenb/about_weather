// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForeignModel _$ForeignModelFromJson(Map<String, dynamic> json) {
  return ForeignModel(
    name: json['name'] as String,
    continent: json['continent'] as String,
    y: json['y'] as String,
    date: json['date'] as String,
    isUpdated: json['isUpdated'] as bool,
    confirmAdd: json['confirmAdd'] as int,
    confirmAddCut: json['confirmAddCut'] as int,
    confirm: json['confirm'] as int,
    suspect: json['suspect'] as int,
    dead: json['dead'] as int,
    heal: json['heal'] as int,
    nowConfirm: json['nowConfirm'] as int,
    confirmCompare: json['confirmCompare'] as int,
    nowConfirmCompare: json['nowConfirmCompare'] as int,
    healCompare: json['healCompare'] as int,
    deadCompare: json['deadCompare'] as int,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : ForeignArea.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForeignModelToJson(ForeignModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'continent': instance.continent,
      'y': instance.y,
      'date': instance.date,
      'isUpdated': instance.isUpdated,
      'confirmAdd': instance.confirmAdd,
      'confirmAddCut': instance.confirmAddCut,
      'confirm': instance.confirm,
      'suspect': instance.suspect,
      'dead': instance.dead,
      'heal': instance.heal,
      'nowConfirm': instance.nowConfirm,
      'confirmCompare': instance.confirmCompare,
      'nowConfirmCompare': instance.nowConfirmCompare,
      'healCompare': instance.healCompare,
      'deadCompare': instance.deadCompare,
      'children': instance.children,
    };
