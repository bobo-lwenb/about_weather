// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveList _$LiveListFromJson(Map<String, dynamic> json) {
  return LiveList(
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : LiveIndex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LiveListToJson(LiveList instance) => <String, dynamic>{
      'list': instance.list,
    };
