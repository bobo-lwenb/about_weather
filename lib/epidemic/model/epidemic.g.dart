// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epidemic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Epidemic _$EpidemicFromJson(Map<String, dynamic> json) {
  return Epidemic(
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    dataSourceUpdateTime: json['dataSourceUpdateTime'] == null
        ? null
        : UpdateTime.fromJson(
            json['dataSourceUpdateTime'] as Map<String, dynamic>),
    trend: (json['trend'] as List)
        ?.map((e) => e == null
            ? null
            : TrendDetailed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provinceArray: (json['provinceArray'] as List)
        ?.map((e) =>
            e == null ? null : Province.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EpidemicToJson(Epidemic instance) => <String, dynamic>{
      'country': instance.country,
      'dataSourceUpdateTime': instance.dataSourceUpdateTime,
      'trend': instance.trend,
      'provinceArray': instance.provinceArray,
    };
