// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return Alert(
    content: json['content'] as String,
    infoid: json['infoid'] as int,
    level: json['level'] as String,
    name: json['name'] as String,
    pubTime: json['pub_time'] as String,
    title: json['title'] as String,
    type: json['type'] as String,
    updateTime: json['update_time'] as String,
    landDefenseId: json['land_defense_id'] as String,
    portDefenseId: json['port_defense_id'] as String,
  );
}

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'content': instance.content,
      'infoid': instance.infoid,
      'land_defense_id': instance.landDefenseId,
      'level': instance.level,
      'name': instance.name,
      'port_defense_id': instance.portDefenseId,
      'pub_time': instance.pubTime,
      'title': instance.title,
      'update_time': instance.updateTime,
      'type': instance.type,
    };
