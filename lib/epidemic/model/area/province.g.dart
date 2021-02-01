// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    totalCured: json['totalCured'] as int,
    totalDeath: json['totalDeath'] as int,
    totalIncrease: json['totalIncrease'] as int,
    cityArray: (json['cityArray'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    childStatistic: json['childStatistic'] as String,
    totalDoubtful: json['totalDoubtful'] as int,
    totalConfirmed: json['totalConfirmed'] as int,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'totalCured': instance.totalCured,
      'totalDeath': instance.totalDeath,
      'totalIncrease': instance.totalIncrease,
      'cityArray': instance.cityArray,
      'childStatistic': instance.childStatistic,
      'totalDoubtful': instance.totalDoubtful,
      'totalConfirmed': instance.totalConfirmed,
    };
