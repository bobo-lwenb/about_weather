// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    totalCured: json['totalCured'] as int,
    totalDeath: json['totalDeath'] as int,
    totalIncrease: json['totalIncrease'] as int,
    incDoubtful: json['incDoubtful'] as int,
    childStatistic: json['childStatistic'] as String,
    totalConfirmed: json['totalConfirmed'] as int,
    time: json['time'] as String,
    totalDoubtful: json['totalDoubtful'] as int,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'totalCured': instance.totalCured,
      'totalDeath': instance.totalDeath,
      'totalIncrease': instance.totalIncrease,
      'incDoubtful': instance.incDoubtful,
      'childStatistic': instance.childStatistic,
      'totalDoubtful': instance.totalDoubtful,
      'time': instance.time,
      'totalConfirmed': instance.totalConfirmed,
    };
