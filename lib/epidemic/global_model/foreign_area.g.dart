// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreign_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForeignArea _$ForeignAreaFromJson(Map<String, dynamic> json) {
  return ForeignArea(
    name: json['name'] as String,
    date: json['date'] as String,
    nameMap: json['nameMap'] as String,
    isUpdated: json['isUpdated'] as bool,
    confirmAdd: json['confirmAdd'] as int,
    confirmAddCut: json['confirmAddCut'] as int,
    confirm: json['confirm'] as int,
    suspect: json['suspect'] as int,
    dead: json['dead'] as int,
    heal: json['heal'] as int,
  );
}

Map<String, dynamic> _$ForeignAreaToJson(ForeignArea instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'nameMap': instance.nameMap,
      'isUpdated': instance.isUpdated,
      'confirmAdd': instance.confirmAdd,
      'confirmAddCut': instance.confirmAddCut,
      'confirm': instance.confirm,
      'suspect': instance.suspect,
      'dead': instance.dead,
      'heal': instance.heal,
    };
