// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceName _$PlaceNameFromJson(Map<String, dynamic> json) {
  return PlaceName(
    prov: json['prov'] as String,
    flag: json['flag'] as bool,
    area: json['area'] as String,
    cityInfo: json['cityInfo'] == null
        ? null
        : CityInfo.fromJson(json['cityInfo'] as Map<String, dynamic>),
    areaCode: json['areaCode'] as String,
    distric: json['distric'] as String,
    areaid: json['areaid'] as String,
  );
}

Map<String, dynamic> _$PlaceNameToJson(PlaceName instance) => <String, dynamic>{
      'prov': instance.prov,
      'flag': instance.flag,
      'area': instance.area,
      'cityInfo': instance.cityInfo,
      'areaCode': instance.areaCode,
      'distric': instance.distric,
      'areaid': instance.areaid,
    };
