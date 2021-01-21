// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResBody _$ResBodyFromJson(Map<String, dynamic> json) {
  return ResBody(
    retCode: json['ret_code'] as int,
    events: (json['list'] as List)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResBodyToJson(ResBody instance) => <String, dynamic>{
      'ret_code': instance.retCode,
      'list': instance.events,
    };
