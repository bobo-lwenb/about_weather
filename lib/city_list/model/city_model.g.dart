// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return CityModel(
    showTop: json['showTop'] as bool,
    name: json['name'] as String,
    temperature: json['temperature'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'showTop': instance.showTop,
      'name': instance.name,
      'temperature': instance.temperature,
      'icon': instance.icon,
    };
