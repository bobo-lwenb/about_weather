// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    callbackTime: json['callbackTime'] as String,
    locationTime: json['locationTime'] as String,
    locationType: json['locationType'] as int,
    latitude: json['latitude'],
    longitude: json['longitude'],
    accuracy: (json['accuracy'] as num).toDouble(),
    altitude: (json['altitude'] as num).toDouble(),
    bearing: (json['bearing'] as num).toDouble(),
    speed: (json['speed'] as num).toDouble(),
    country: json['country'] as String,
    province: json['province'] as String,
    city: json['city'] as String,
    district: json['district'] as String,
    street: json['street'] as String,
    streetNumber: json['streetNumber'] as String,
    cityCode: json['cityCode'] as String,
    adCode: json['adCode'] as String,
    address: json['address'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'callbackTime': instance.callbackTime,
      'locationTime': instance.locationTime,
      'locationType': instance.locationType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'bearing': instance.bearing,
      'speed': instance.speed,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'street': instance.street,
      'streetNumber': instance.streetNumber,
      'cityCode': instance.cityCode,
      'adCode': instance.adCode,
      'address': instance.address,
      'description': instance.description,
    };
