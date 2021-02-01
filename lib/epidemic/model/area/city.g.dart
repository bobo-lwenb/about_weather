// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    totalCured: json['totalCured'] as int,
    totalDeath: json['totalDeath'] as int,
    totalIncrease: json['totalIncrease'] as int,
    childStatistic: json['childStatistic'] as String,
    totalDoubtful: json['totalDoubtful'] as int,
    totalConfirmed: json['totalConfirmed'] as int,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'totalCured': instance.totalCured,
      'totalDeath': instance.totalDeath,
      'totalIncrease': instance.totalIncrease,
      'childStatistic': instance.childStatistic,
      'totalDoubtful': instance.totalDoubtful,
      'totalConfirmed': instance.totalConfirmed,
    };
