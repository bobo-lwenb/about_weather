// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    retCode: json['ret_code'] as int,
    feeCode: json['showapi_fee_code'] as int,
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : PlaceName.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'ret_code': instance.retCode,
      'showapi_fee_code': instance.feeCode,
      'list': instance.list,
    };
