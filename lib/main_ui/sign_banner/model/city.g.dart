// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    cityId: json['cityId'] as int,
    counname: json['counname'] as String,
    ianatimezone: json['ianatimezone'] as String,
    name: json['name'] as String,
    pname: json['pname'] as String,
    secondaryname: json['secondaryname'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'cityId': instance.cityId,
      'counname': instance.counname,
      'ianatimezone': instance.ianatimezone,
      'name': instance.name,
      'pname': instance.pname,
      'secondaryname': instance.secondaryname,
      'timezone': instance.timezone,
    };
