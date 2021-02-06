// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalSources _$GlobalSourcesFromJson(Map<String, dynamic> json) {
  return GlobalSources(
    foreignList: (json['foreignList'] as List)
        ?.map((e) =>
            e == null ? null : ForeignModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    globalStatis: json['globalStatis'] == null
        ? null
        : GlobalStatis.fromJson(json['globalStatis'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GlobalSourcesToJson(GlobalSources instance) =>
    <String, dynamic>{
      'foreignList': instance.foreignList,
      'globalStatis': instance.globalStatis,
    };
