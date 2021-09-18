// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalData _$InternalDataFromJson(Map<String, dynamic> json) {
  return InternalData(
    lastUpdateTime: json['lastUpdateTime'] as String?,
    chinaTotal: json['chinaTotal'] == null
        ? null
        : ChinaTotal.fromJson(json['chinaTotal'] as Map<String, dynamic>),
    chinaAdd: json['chinaAdd'] == null
        ? null
        : ChinaAdd.fromJson(json['chinaAdd'] as Map<String, dynamic>),
    isShowAdd: json['isShowAdd'] as bool?,
    showAddSwitch: json['showAddSwitch'] == null
        ? null
        : ShowAddSwitch.fromJson(json['showAddSwitch'] as Map<String, dynamic>),
    areaTree: (json['areaTree'] as List<dynamic>?)
        ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InternalDataToJson(InternalData instance) =>
    <String, dynamic>{
      'lastUpdateTime': instance.lastUpdateTime,
      'chinaTotal': instance.chinaTotal,
      'chinaAdd': instance.chinaAdd,
      'isShowAdd': instance.isShowAdd,
      'showAddSwitch': instance.showAddSwitch,
      'areaTree': instance.areaTree,
    };
