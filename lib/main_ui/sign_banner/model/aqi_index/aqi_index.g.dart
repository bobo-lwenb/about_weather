// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQIIndex _$AQIIndexFromJson(Map<String, dynamic> json) {
  return AQIIndex(
    cityName: json['cityName'] as String?,
    co: json['co'] as String?,
    coC: json['coC'] as String?,
    no2: json['no2'] as String?,
    no2C: json['no2C'] as String?,
    o3: json['o3'] as String?,
    o3C: json['o3C'] as String?,
    pm10: json['pm10'] as String?,
    pm10C: json['pm10C'] as String?,
    pm25: json['pm25'] as String?,
    pm25C: json['pm25C'] as String?,
    pubtime: json['pubtime'] as String?,
    rank: json['rank'] as String?,
    o2: json['o2'] as String?,
    so2C: json['so2C'] as String?,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$AQIIndexToJson(AQIIndex instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'co': instance.co,
      'coC': instance.coC,
      'no2': instance.no2,
      'no2C': instance.no2C,
      'o3': instance.o3,
      'o3C': instance.o3C,
      'pm10': instance.pm10,
      'pm10C': instance.pm10C,
      'pm25': instance.pm25,
      'pm25C': instance.pm25C,
      'pubtime': instance.pubtime,
      'rank': instance.rank,
      'o2': instance.o2,
      'so2C': instance.so2C,
      'value': instance.value,
    };
